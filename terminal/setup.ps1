$settingsPath = Resolve-Path -Path "C:/Users/nagla/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"

if(Test-Path -Path $settingsPath){
    $np = $settingsPath.Path -replace ".json",".old.json"
    Rename-Item -Path $settingsPath -NewName $np
}

New-Item -ItemType SymbolicLink -Path $settingsPath -Target "$PSScriptPath/settings.json" -Force
