Import-Module "$PSScriptRoot/config/PsExtensions.psm1"
Import-Module "$PSScriptRoot/config/ProfileTemplate.psm1"
Set-VIMode
Set-Profile cat

$Env:PATH = @(
    "C:\Users\nagla\AppData\Local\nvim-data\mason\bin"
    "C:\Program Files\PowerShell\7"
    "C:\WINDOWS\system32"
    "C:\WINDOWS"
    "C:\WINDOWS\System32\Wbem"
    "C:\WINDOWS\System32\OpenSSH\"
    "C:\Program Files\Git\cmd"
    "C:\Tools\\gsudo\Current"
    "C:\Program Files\nodejs\"
    "C:\Program Files\dotnet\"
    "C:\Program Files\GitHub CLI\"
    "C:\Program Files\OpenJDK\jdk-21.0.1\bin"
    "C:\Users\nagla\AppData\Local\Microsoft\WindowsApps"
    "C:\ProgramData\chocolatey\bin"
    "C:\Users\nagla\lib\"
    "C:\Program Files\Neovim\bin"
    "C:\Users\nagla\AppData\Roaming\npm"
    "C:\Users\nagla\AppData\Local\Programs\oh-my-posh\bin"
    "C:\Users\nagla\AppData\Local\Programs\Microsoft VS Code\bin"
    "C:\Users\nagla\.dotnet\tools"
    "C:\Users\nagla\AppData\Local\JetBrains\Toolbox\scripts"
    "C:\Users\nagla\AppData\Local\Microsoft\WindowsApps"
    "C:\Users\nagla\tools\kotlinc\bin"
    "C:\Users\nagla\AppData\Local\Microsoft\WinGet\Links"
) -join ";"

$Env:MSBUILDTERMINALLOGGER = $true
$Env:DOTFILES = "c:\Users\nagla\.dotfiles\"
$Env:TERM = "xterm-256color"

Enable-Zoxide
