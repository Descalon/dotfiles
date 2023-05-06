Import-Module "$PSScriptRoot/ProfileTemplate.psm1"
Set-ViMode

Set-Profile princess

$shellIntegrationPath = "c:\Users\nagla\AppData\Local\Programs\Microsoft VS Code\resources\app\out\vs\workbench\contrib\terminal\browser\media\shellIntegration.ps1"
if ($env:TERM_PROGRAM -eq "vscode") { . $shellintegrationPath }
