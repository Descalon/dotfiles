Set-PSReadLineKeyHandler -ViMode Command -Chord "g,b" -ScriptBlock {
    $buff = ""
    $pos = 0
    [Microsoft.Powershell.PSConsoleReadLine]::GetBufferState([ref] $buff, [ref] $pos)
    [Microsoft.Powershell.PSConsoleReadLine]::DeleteLine()
    [Microsoft.Powershell.PSConsoleReadLine]::Insert("git checkout -b {0}")
    [Microsoft.Powershell.PSConsoleReadLine]::AcceptLine()
} -Description "Removes text from current buffer and inserts it into ``git checkout -b {0}`` "
Set-PSReadLineKeyHandler -ViMode Command -Chord "g,n" -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadLine]::DeleteLine()
    [Microsoft.Powershell.PSConsoleReadLine]::Insert("git nuke")
    [Microsoft.Powershell.PSConsoleReadLine]::AcceptLine()
} -Description "Enters git nuke"

Set-PSReadLineKeyHandler -ViMode Command -Chord "g,y" -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadLine]::DeleteLine()
    [Microsoft.Powershell.PSConsoleReadLine]::Insert("git yolo")
    [Microsoft.Powershell.PSConsoleReadLine]::AcceptLine()
} -Description "Enters git yolo"

Set-PSReadLineKeyHandler -ViMode Command -Chord "g,s" -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadLine]::DeleteLine()
    [Microsoft.Powershell.PSConsoleReadLine]::Insert("git status")
    [Microsoft.Powershell.PSConsoleReadLine]::AcceptLine()
} -Description "Enters git status"

Set-PSReadLineKeyHandler -ViMode Command -Chord "g,l" -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadLine]::DeleteLine()
    [Microsoft.Powershell.PSConsoleReadLine]::Insert("git adog")
    [Microsoft.Powershell.PSConsoleReadLine]::AcceptLine()
} -Description "Enters git adog"

Set-PSReadLineKeyHandler -ViMode Command -Chord "g,m" -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadLine]::DeleteLine()
    [Microsoft.Powershell.PSConsoleReadLine]::Insert("git commit -am ''")
    [Microsoft.Powershell.PSConsoleReadLine]::SetCursorPosition(16)
    [Microsoft.Powershell.PSConsoleReadLine]::ViInsertMode()
} -Description "Inserts ``git commit -am ''`` puts cursor in the quotes and enters insert mode"

Set-PSReadLineKeyHandler -ViMode Command -Chord "k" -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadLine]::PreviousHistory()
    [Microsoft.Powershell.PSConsoleReadLine]::EndOfLine()
} -Description "Replace the input with the previous item in the history and moves cursor to end of line"

Set-PSReadLineKeyHandler -ViMode Command -Chord "j" -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadLine]::NextHistory()
    [Microsoft.Powershell.PSConsoleReadLine]::EndOfLine()
} -Description "Replace the input with the next item in the history and moves cursor to end of line"

Set-PSReadLineKeyHandler -ViMode Insert -Chord "Ctrl+c" -Function ViCommandMode
Set-PSReadLineKeyHandler -ViMode Insert -Chord "Ctrl+l" -Function ForwardWord
Set-PSReadLineKeyHandler -ViMode Insert -Chord "Ctrl+j" -Function AcceptSuggestion
Set-PSReadLineKeyHandler -ViMode Insert -Chord "Ctrl+k" -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion()
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
} -Description "Accepts suggestion and line"
