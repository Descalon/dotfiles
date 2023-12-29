Import-Module "$PSScriptRoot/PsExtensions.psm1"
Import-Module "$PSScriptRoot/ProfileTemplate.psm1"
Import-PSReadlineVimConfiguration
. "$PSScriptRoot/VimKeybindings.ps1"

Set-Profile princess
$env:Term = "xterm-x256color"
