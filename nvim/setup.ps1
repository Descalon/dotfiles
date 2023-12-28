$nvimPath = Resolve-Path -Path "~/AppData/Local/nvim"

if(Test-Path -Path $nvimPath){
    Remove-Item -Path $nvimPath
}

New-Item -ItemType SymbolicLink -Path $nvimPath -Target "$PSScriptPath/nvim"