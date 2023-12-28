$settings = "$PSScriptRoot/settings.json"
$keybindings = "$PSScriptRoot/keybindings.json"

$settingsSLPath = Resolve-Path -Path "~/appdata/roaming/Code/User/settings.json"
$keybindingsSLPath = Resolve-Path -Path "~/appdata/roaming/Code/User/keybindings.json"


if(Test-Path $settingsSLPath){
    $np = $settingsSLPath.Path -replace ".json",".old.json"
    Rename-Item -Path $settingsSLPath -NewName $np
}

if(Test-Path $keybindingsSLPath){
    $np = $keybindingsSLPath.Path -replace ".json",".old.json"
    Rename-Item -Path $keybindingsSLPath -NewName $np
}

New-Item -ItemType SymbolicLink -Path $settingsSLPath -Target $settings
New-Item -ItemType SymbolicLink -Path $keybindingsSLPath -Target $keybindings