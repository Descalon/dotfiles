Set-ExecutionPolicy Bypass -Scope CurrentUser

Invoke-WebRequest -Uri "https://aka.ms/getwinget" -OutFile "C:\2.appx"
Invoke-WebRequest -Uri "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx" -OutFile "C:\1.appx"

Get-ChildItem "c:\" -Filter "*appx" | ForEach-Object {
    Add-AppPackage $_
}