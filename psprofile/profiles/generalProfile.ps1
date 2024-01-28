Import-Module "$PSScriptRoot/PsExtensions.psm1"
Import-Module "$PSScriptRoot/ProfileTemplate.psm1"
Set-VIMode

. "dotenv.ps1"

Set-Profile mydarkblood2
$env:Term = "xterm-x256color"
