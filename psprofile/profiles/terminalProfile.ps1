Import-Module "$PSScriptRoot/ProfileTemplate.psm1"
Import-Module "$PSScriptRoot/PsExtensions.psm1"
Set-VIMode

Set-Profile princess

if ($env:TERM_PROGRAM -eq "vscode") { . "$(code --locate-shell-integration-path pwsh)" }
