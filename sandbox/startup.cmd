ECHO OFF 
ECHO INSTALLING

CALL explorer.exe c:\
CALL powershell.exe -NoLogo -NoProfile -Command "Set-ExecutionPolicy Unrestricted -Scope CurrentUser"
CALL powershell.exe -NoLogo -NoProfile -File %1 

START powershell.exe -NoLogo -NoProfile -NoExit -Command "cd c:\psprofile\setup;Write-Host 'Bootstrapping succeded'"