Import-Module "$PSScriptRoot/PsExtensions.psm1"
Import-Module "$PSScriptRoot/ProfileTemplate.psm1"
Set-VIMode

Set-Profile princess
$env:Term = "xterm-x256color"
