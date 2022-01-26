# module
Import-Module posh-git
Import-Module ZLocation

# general
$parameters = @{
  BellStyle = "None"
  EditMode = "Emacs"
  HistoryNoDuplicates = $true
  HistorySearchCursorMovesToEnd = $true
}
Set-PSReadLineOption @parameters

# bat
$env:BAT_PAGER = "less -RF"
$env:BAT_STYLE = "header,numbers"
$env:BAT_THEME = "OneHalfDark"
If (Test-Path Alias:cat) { Remove-Item Alias:cat }
function cat { $input | bat --paging never $args }

# lsd
Set-Alias ls lsd

# delta
If (Test-Path Alias:diff) { Remove-Item Alias:diff -Force }
Set-Alias diff delta

# ripgrep
Set-Alias grep rg

# fzf
$env:FZF_ALT_C_COMMAND = "fd -HL -t d -E '.git/'"
$env:FZF_CTRL_T_COMMAND = "fd -HL -t f -E '.git/*'"
$env:FZF_DEFAULT_COMMAND = "fd -HL -t f -E '.git/*'"
$env:FZF_DEFAULT_OPTS = "--height 40% --layout=reverse --inline-info --border --color=dark --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef"
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# ghq
function gf {
  $path = ghq list | fzf
  If ($LastExitCode -eq 0) { cd "$(ghq root)\$path" }
}

# neovim
Set-Alias vi nvim

# uutils
@"
  arch, base32, base64, basename, cksum, comm, cp, cut, date, df, dircolors, dirname,
  echo, env, expand, expr, factor, false, fmt, fold, hashsum, head, hostname, join, link, ln,
  md5sum, mkdir, mktemp, more, mv, nl, nproc, od, paste, printenv, printf, ptx, pwd,
  readlink, realpath, relpath, rm, rmdir, seq, sha1sum, sha224sum, sha256sum, sha3-224sum,
  sha3-256sum, sha3-384sum, sha3-512sum, sha384sum, sha3sum, sha512sum, shake128sum,
  shake256sum, shred, shuf, sleep, sort, split, sum, sync, tac, tail, tee, test, touch, tr,
  true, truncate, tsort, unexpand, uniq, wc, whoami, yes
"@ -split ',' |
ForEach-Object { $_.trim() } |
Where-Object { ! @('tee', 'sort', 'sleep').Contains($_) } |
ForEach-Object {
    $cmd = $_
    If (Test-Path Alias:$cmd) { Remove-Item -Path Alias:$cmd }
    $fn = '$input | uutils ' + $cmd + ' $args'
    Invoke-Expression "function $cmd { $fn }"
}

# keybind
Set-PSReadLineKeyHandler -key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Chord 'Ctrl+]' -ScriptBlock { gf; [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine() }
Set-PSReadLineKeyHandler -Chord 'Ctrl+;' -ScriptBlock { Invoke-FuzzyZLocation; [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine() }

# starship
Invoke-Expression (&starship init powershell)
