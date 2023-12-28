$setupScripts = Get-ChildItem -Path "script.ps1" -Recurse -Depth 1

foreach ($s in $setupScripts) {
    . $s
}