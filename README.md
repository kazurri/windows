# Windows
[![cc][cc_image]][cc_url]

my windows setting

## Version

* Windows 10 Enterprise 1909

## Installation

### scoop

* Install

```ps1
> Set-ExecutionPolicy RemoteSigned -scope CurrentUser
> Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

* Toolのインストール

```ps1
> scoop install sudo
> sudo scoop install 7zip git --global
> scoop install aria2 bat curl fd gawk less ghq ripgrep sed
> scoop install uutils-coreutils
> scoop install nodejs-tls python ruby
```

* Update & Cleanup

```ps1
> scoop update
> scoop update *
> scoop cleanup *
```

### rust

* exaをbuildするためにrustをインストール
* exaが今後Windowsサポートした場合はscoopでインストールする
* Visual Studio Build Tools 2019のインストール
  * [リンク](https://visualstudio.microsoft.com/ja/downloads/)
  * ワークロード：C++ Build Tools
  * 言語パック：日本語、英語
* rustのインストール
  * [リンク](https://www.rust-lang.org/tools/install)

```ps1
> cargo install --git https://github.com/skyline75489/exa --branch chesterliu/dev/win-support
```

### Windows Terminal

* Microsoft Storeからインストール

### Powershell

* PowerShell Coreのインストール
  * [リンク](https://github.com/PowerShell/PowerShell)

* モジュールのインストール

```ps1
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
```

* プロファイルの編集

```ps1
> notepad $profile
```

* 記載内容

```ps1
# General
$PSReadlineOptions = @{
  BellStyle = "None"
  HistoryNoDuplicates = $true
  HistorySearchCursorMovesToEnd = $true
}
Set-PSReadLineOption @PSReadLineOptions

# Alias
## exa
If (Test-Path Alias:ls) { Remove-Item Alias:ls }
function ls() { exa --icons $args }
function ll() { exa -lh --icons --git $args}
function lt() { exa -lh --icons --sort modified --git $args }
## bat
If (Test-Path Alias:cat) { Remove-Item Alias:cat }
function cat() { $input | bat -p --paging never $args }
function less() { $input | bat $args }
## ripgrep
Set-Alias grep rg
## uutils
function mkdir() { uutils mkdir $args }
If (Test-Path Alias:cp) { Remove-Item Alias:cp }
function cp() { uutils cp $args }
If (Test-Path Alias:mv) { Remove-Item Alias:mv }
function mv() { uutils mv $args }
If (Test-Path Alias:rm) { Remove-Item Alias:rm }
function rm() { uutils rm $args }
## ghq
function g() { cd (ghq list -p (ghq list | fzf )) }
## neovim
Set-Alias vi nvim
```

### msys2

```ps1
> scoop install msys2
> ridk install
```

### neovim

```ps1
> scoop bucket add versions
> scoop install neovim-nightly
> pip install neovim
> gem install neovim
> npm install -g neovim
```

## Font

* [HackGen](https://github.com/yuru7/HackGen)

## License

[![cc][cc_image]][cc_url]

## Author

[Kazuhiro Namigata](mailto:kazurri@gmail.com)

[cc_image]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg?style=flat-square
[cc_url]: http://creativecommons.org/licenses/by/4.0/
