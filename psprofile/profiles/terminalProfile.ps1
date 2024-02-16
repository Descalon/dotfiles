Import-Module "$PSScriptRoot/config/PsExtensions.psm1"
Import-Module "$PSScriptRoot/config/ProfileTemplate.psm1"
Set-VIMode

Set-Profile cat

if ($env:TERM_PROGRAM -eq "vscode") { . "$(code --locate-shell-integration-path pwsh)" }
else { Set-PSReadLineOption -ViModeIndicator Prompt }

Enable-Zoxide
