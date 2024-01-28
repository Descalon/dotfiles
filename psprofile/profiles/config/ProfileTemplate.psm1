Import-Module Terminal-Icons
Import-Module -Name posh-git
Import-Module "$PSScriptRoot/PsExtensions.psm1"

$root = Split-Path $PSScriptRoot | Split-Path

$script:builtinPath = "~/AppData/Local/Programs/oh-my-posh/themes"
$script:localPath = "$root/themes"

Function Register-DotnetArgumentCompleter {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', 'c')]
    [CmdletBinding()]
    param()
    Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
        param($c, $wordToComplete, $cursorPosition)
        dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
    }
}

<#
.SYNOPSIS
    Sets profile to default values
.DESCRIPTION
    Sets profile to default values
.EXAMPLE
    Set-Profile rr
    Will look in the ~/lib/ps/themes folder for a file rr.json and load this to oh-my-posh
.EXAMPLE
    Set-Profile -BuiltinTheme agnoster
    Will look in the oh-my-posh builtin folder for a file agnoster.omp.json and load this to oh-my-posh
.EXAMPLE
    Set-Profile -PoshThemePath ./some/path/to/file.(omp.)?json
    Will look in the oh-my-posh builtin folder for a file agnoster.omp.json and load this to oh-my-posh
#>
Function Set-Profile {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    Param(
        [Parameter(Mandatory, Position = 0, ParameterSetName = "LocalTheme")]
        [ValidateScript({
                $valid = Get-ChildItem $script:localPath -Filter *.json
                $valid -match $_
            })]
        [string]$CustomTheme,
        [Parameter(Mandatory, ParameterSetName = "GlobalTheme")]
        [ValidateScript({
                $valid = Get-ChildItem $script:builtinPath -Filter *.omp.json
                $valid -match $_
            })]
        [string]$BuiltinTheme,
        [Parameter(Mandatory, ParameterSetName = "FullPath")]
        [string]$PoshThemePath
    )

    begin {
        if ($CustomTheme) {
            $PoshThemePath = Join-Path -Path $script:localPath -ChildPath "$CustomTheme.json"
        }
        if ($BuiltinTheme) {
            $PoshThemePath = Join-Path -Path $script:builtinPath -ChildPath "$BuiltinTheme.omp.json"
        }
    }
    process {

        if ($PSCmdlet.ShouldProcess("GetChildItemColorVerticalSpace", "Sets value to 0")) {
            $GetChildItemColorVerticalSpace = 0
            $GetChildItemColorVerticalSpace | out-null #This is a warning suppression
        }

        if ($PSCmdlet.ShouldProcess("Env:GIT_SSH", "Sets value to null")) {
            $Env:GIT_SSH = $null
        }
        if ($PSCmdlet.ShouldProcess("Env:POSH_GIT_ENABLED", "Sets value to true")) {
            $Env:POSH_GIT_ENABLED = $true
        }

        Invoke-OhMyPosh -Path $PoshThemePath
        Register-DotnetArgumentCompleter
    }
}

<#
.SYNOPSIS
    Imports default PSReadlineConfiguration
.DESCRIPTION
    Imports default PSReadlineConfiguration
#>
Function Set-VIMode {
    [CmdletBinding()]
    param()
    Set-PSReadlineOption -EditMode Vi
    Set-PSReadlineOption -ViModeIndicator cursor
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -Colors @{
        InlinePrediction = '#8888AA'
        Parameter        = 'DarkMagenta'
        Operator         = 'Magenta'
        String           = 'Green'
    }
    $env:Visual = "nvim"
    . "$PSScriptRoot/VimKeybindings.ps1"
}
<#
.SYNOPSIS
    Imports default PSReadlineConfiguration
.DESCRIPTION
    Imports default PSReadlineConfiguration
#>
Function Import-PSReadlineConfiguration {
    [CmdletBinding()]
    param()
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -Colors @{
        InlinePrediction = '#8888AA'
        Parameter        = 'DarkMagenta'
        Operator         = 'Magenta'
        String           = 'Green'
    }
    Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord
    Set-PSReadLineKeyHandler -Chord "Ctrl+j" -Function AcceptSuggestion
    Set-PSReadLineKeyHandler -Chord "Ctrl+k" -ScriptBlock {
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion()
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }
}

Export-ModuleMember -Function "Set-Profile"
Export-ModuleMember -Function "Import-PSReadlineConfiguration"
Export-ModuleMember -Function "Set-VIMode"
