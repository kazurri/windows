# general
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

$parameters = @{
  BellStyle = "None"
  EditMode = "Emacs"
  HistoryNoDuplicates = $true
  HistorySearchCursorMovesToEnd = $true
}
Set-PSReadLineOption @parameters
Set-PSReadLineKeyHandler -key Tab -Function MenuComplete

# bat
Set-Alias less bat

# eza
If (Test-Path Alias:ls) { Remove-Item Alias:ls -Force }
function ls($args) { eza --icons --git $args }

# delta
If (Test-Path Alias:diff) { Remove-Item Alias:diff -Force }
Set-Alias diff delta

# rg
Set-Alias grep rg

# neovim
Set-Alias vi nvim

# bottom
Set-Alias top btm

# starship
Invoke-Expression (&starship init powershell)

