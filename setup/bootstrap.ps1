#Requires -RunAsAdministrator
& winget install Microsoft.Powershell --silent --accept-source-agreements

$pwsh = Get-ChildItem -Path "$($env:ProgramFiles)\PowerShell\" -Filter "pwsh.exe" -Recurse | Select-Object -First 1

& $pwsh -noLogo -noProfile -noExit
