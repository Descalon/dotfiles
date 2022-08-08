Import-Module "$PSScriptRoot/ProfileTemplate.psm1"
Set-Profile mylambda

$shellintegrationPath = "c:\Program Files\Microsoft VS Code\resources\app\out\vs\workbench\contrib\terminal\browser\media\shellIntegration.ps1"
if ($env:TERM_PROGRAM -eq "vscode") { . $shellintegrationPath }
