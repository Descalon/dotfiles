$configs = @(
    "configuration.dsc.yaml",
    "pwsh.dsc.yaml"
    #"choco.dsc.yaml"
)

$configs | ForEach-Object {
    winget configure -f "$PSScriptRoot/$_" --accept-configuration-agreements --disable-interactivity
}