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

# alias
## exa
If (Test-Path Alias:ls) { Remove-Item Alias:ls -Force }
function ls($args) { exa --color=always --icons --header --git $args }
## bat
If (Test-Path Alias:cat) { Remove-Item Alias:cat -Force }
function cat($file) { bat --paging=never $file }
Set-Alias less bat
## delta
If (Test-Path Alias:diff) { Remove-Item Alias:diff -Force }
Set-Alias diff delta
## rg
Set-Alias grep rg
## neovim
Set-Alias vi nvim
## bottom
Set-Alias top btm

# fzf
$env:FZF_ALT_C_COMMAND = "fd --type d --hidden --follow --exclude .git"
$env:FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow --exclude .git"
$env:FZF_DEFAULT_OPTS = "--height 50% --layout=reverse --no-unicode --info=inline"

# PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# ghq
function gf {
  $path = $(ghq list | fzf)
  If ($LastExitCode -eq 0) { Set-Location "$(ghq root)\$path" }
}

# starship
Invoke-Expression (&starship init powershell)
