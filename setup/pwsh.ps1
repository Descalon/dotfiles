#Requires -RunAsAdministrator
[CmdletBinding(
    SupportsShouldProcess,
    ConfirmImpact = 'High'
)]
Param(
    [switch]$ContintueOnNonCoreEditions
)
$root = Split-Path $PSScriptRoot

if (-not $ContintueOnNonCoreEditions -and $PSVersionTable.PSEdition -ne 'Core') {
    $query = "This script is built for the Core PSEdition. "
    $query += "Currently running this script with $($PSVersionTable.PSEdition), "
    $query += "are you sure you want to continue?"

    if (-not $PSCmdlet.ShouldContinue($query, "Non core edition found")) {
        return
    }
}

$ErrorActionPreference = 'SilentlyContinue'
$chocoInstalled = & choco -version
$wingetInstalled = & winget --version
$ErrorActionPreference = 'Stop'

Function Install-Chocolatey {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingInvokeExpression', '')]
    [CmdletBinding()]
    param()
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    (New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1') | Invoke-Expression

}
Write-Verbose "Checking if chocolatey is installed"
If (-not $chocoInstalled -and $PSCmdlet.ShouldProcess("Chocolatey", "Install")) {
    Write-Verbose "Chocolatey is not installed"
    Install-Chocolatey
}

If ($PSCmdlet.ShouldProcess("choco.packages.config", "Install software")) {
    Write-Verbose "Installing chocolatey packages"
    $path = Join-Path -Path $PSScriptRoot -ChildPath "chocolatey.packages.config"
    Write-Debug "Following packages will be installed:"
    $path | Write-Debug
    & choco install $path -y
}

if ($PSCmdlet.ShouldProcess("Windows Terminal Template", "Create settings file from target")) {
    Write-Verbose "Generating settings file for Windows Terminal"
    $templatePath = Join-Path -Path $root -ChildPath "config/winterm.template.json"
    $outputPath = Join-Path -Path $root -ChildPath "config/winterm.json"
    $escapedRoot = $root -replace '\\', '/'

    (Get-Content $templatePath) -replace "${PROFILE_PATH}", $escapedRoot > $outputPath
}

$repo = Get-PSRepository -Name PSGallery
if ($repo.InstallationPolicy -eq 'Untrusted' -and $PSCmdlet.ShouldProcess("PSGallery", "Setting Installation Policy to Trusted")) {
    Write-Verbose "Setting PSGallery to Trusted"
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
}

$path = Join-Path -Path $PSScriptRoot -ChildPath "powershell.modules.ps1"
$modules = . $path
Install-Module -Name $modules -Repository PSGallery -WhatIf:$WhatIfPreference

$path = Join-Path -Path $PSScriptRoot -ChildPath "winget.packages.ps1"
$modules = . $path

if ($wingetInstalled) {
    if ($PSCmdlet.ShouldProcess("Windows Package Manager", "Installing packages") ) {
        Write-Verbose "Installing Windows Package Manager packages"
        Write-Debug "Following packages will be installed"
        $modules | Write-Debug
        $modules | ForEach-Object {
            & winget install $_
        }
    }
}
else {
    Write-Warning "Winget is not found on this machine. The following packages are not installed"
    Write-Warning $modules
}