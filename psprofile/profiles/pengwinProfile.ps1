Import-Module "$PSScriptRoot/PsExtensions.psm1"
Import-Module "$PSScriptRoot/ProfileTemplate.psm1"
Set-VIMode

Set-Profile princess

$env:TERM = "xterm-x256color"
$env:PATH = @(
    "/opt/microsoft/powershell/7"
    "/home/descalon/.local/share/nvim/mason/bin"
    "/opt/microsoft/powershell/7"
    "/home/linuxbrew/.linuxbrew/bin"
    "/home/linuxbrew/.linuxbrew/sbin"
    "/usr/local/sbin"
    "/usr/local/bin"
    "/usr/sbin"
    "/usr/bin"
    "/sbin"
    "/bin"
    "/usr/games"
    "/usr/local/games"
    "/usr/lib/wsl/lib"
) -join ":"
