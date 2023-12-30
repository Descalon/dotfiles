$configfile = "$PSScriptRoot/git.config"

$gitconfigpath = Resolve-Path -Path "~/.gitconfig"


if(Test-Path $gitconfigpath){
    Rename-Item -Path $gitconfigpath -NewName ".gitconfig.old"
}

New-Item -ItemType SymbolicLink -Path $gitconfigpath -Target $configfile
