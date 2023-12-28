Import-Module "$PSScriptRoot/ProfileTemplate.psm1"
Import-Module "$PSScriptRoot/PsExtensions.psm1"
Import-PSReadlineVimConfiguration
. "$PSScriptRoot/vimKeyBindings.ps1"

Set-Profile princess

if ($env:TERM_PROGRAM -eq "vscode") { . "$(code --locate-shell-integration-path pwsh)" }
