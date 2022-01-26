# Windows
[![cc][cc_image]][cc_url]

my windows setting

## Version

* Windows 10 Enterprise 20H2

## Installation

### scoop

* scoopのインストール

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
iwr -useb get.scoop.sh | iex
```

* ツールのインストール

```powershell
scoop install sudo
sudo scoop install 7zip git --global
scoop install aria2 curl
scoop install gitui bat less which fd ripgrep fzf gawk sed ghq
scoop install uutils-coreutils
scoop install python nodejs-lts
```

* Update & Cleanup

```powershell
scoop update
scoop update *
scoop cleanup *
scoop cache rm *
```

## ruby

* rubyのインストール

```powershell
scoop install ruby
```

* msys2/ridkのインストール

```powershell
scoop install msys2
ridk install
```

## ghq

* ghq rootの設定

```powershell
git config --global <ghq root>
```

### neovim

* neovimのインストール

```powershell
scoop bucket add versions
scoop install neovim
```

* モジュールのインストール

```powershell
pip install neovim
gem install neovim
npm install -g neovim
```

* 環境変数の設定
  * XDG_CACHE_HOME → %USERPROFILE%\.cache
  * XDG_CONFIG_HOME → %USERPROFILE%\.config

* 設定ファイルのコピー

```powershell
ghq get kazurri/dotfiles
cp "$(ghq list -p dotfiles)\.config\nvim" $HOME\.config\ -Recurse -Force
```

### Powershell Core

* PowerShell Coreのインストール

```powershell
scoop install pwsh
```

* モジュールのインストール

```powershell
Install-Module posh-git -Scope CurrentUser -Force
Install-Module PSReadLine -Scope CurrentUser -SkipPublisherCheck -Force
Install-Module PSFzf -Scope CurrentUser -SkipPublisherCheck -Force
Install-Module ZLocation -Scope CurrentUser -Force
```

* プロファイルのコピー

```powershell
ghq get kazurri/windows
$path = $env:USERPROFILE + "\Documents\PowerShell"
If (-not (Test-Path $path)) { mkdir $path}
cp "$(ghq list -p windows)\Microsoft.PowerShell_profile.ps1" $PROFILE -Force
```

### Windows Terminal

* Windows Terminalのインストール

```powershell
scoop bucket add extras
scoop install windows-terminal
```

* プロファイルのコピー

```powershell
ghq get kazurri/windows
$path = $env:LOCALAPPDATA + "\Microsoft\Windows Terminal"
If (-not (Test-Path $path)) { mkdir $path}
cp "$(ghq list -p windows)\settings.json" $path\ -Force
```

### Font

* [HackGen](https://github.com/yuru7/HackGen)

## License

[![cc][cc_image]][cc_url]

## Author

[Kazuhiro Namigata](mailto:kazurri@gmail.com)

[cc_image]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg?style=flat-square
[cc_url]: http://creativecommons.org/licenses/by/4.0/
