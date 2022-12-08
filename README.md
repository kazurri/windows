# Windows
[![cc][cc_image]][cc_url]

my windows setting

## Version

* Windows 10 Enterprise 21H2

## Installation

### scoop

* scoopのインストール

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
iwr -useb get.scoop.sh | iex
```

* ツールのインストール

```pwsh
# must
scoop install 7zip aria2 curl
# git
scoop install git gitui ghq
# fzf
scoop install fzf
# legacy tools
scoop install gawk less sed which
# rust tools
scoop install bat bat delta fd ripgrep starship uutils-coreutils
# programing
scoop install python
# extras
scoop bucket add extras
scoop install putty teraterm vcxsrv
scoop install pdfarranger rufus sysinternals winmerge winscp wireshark
```

* Update & Cleanup

```pwsh
scoop update
scoop update *
scoop cleanup *
scoop cache rm *
```

### rust

* Visual Studio 2022 Build Tools（Build Tools for Visual Studio 2022）のインストール
  * [ダウンロード先](https://visualstudio.microsoft.com/ja/downloads/)
  * [C++によるデスクトップ開発]を選択して[インストール]を実行

* rustupのインストール

```pwsh
scoop install rustup-msvc
rustup default stable
```

### exa

* exa（win-support）のインストール

```pwsh
cargo install --git https://github.com/skyline75489/exa --branch chesterliu/dev/win-support
```

## ghq

* ghq rootの設定

```pwsh
git config --global <ghq root>
```

### Powershell Core

* PowerShell Coreのインストール
  * [PowerShell](https://github.com/PowerShell/PowerShell)

* モジュールのインストール

```pwsh
Install-Module PSReadLine -Scope CurrentUser -SkipPublisherCheck -Force
Install-Module PSFzf -Scope CurrentUser -SkipPublisherCheck -Force
```

* プロファイルのコピー

```pwsh
ghq get kazurri/windows
$path = $env:USERPROFILE + "\Documents\PowerShell"
If (-not (Test-Path $path)) { mkdir $path}
cp "$(ghq list -p windows)\Microsoft.PowerShell_profile.ps1" $PROFILE -Force
```

### neovim

* neovimのインストール

```pwsh
scoop bucket add versions
scoop install neovim
```

* モジュールのインストール

```pwsh
pip install --user pynvim
```

* 環境変数の設定
  * XDG_CACHE_HOME → %USERPROFILE%\.cache
  * XDG_CONFIG_HOME → %USERPROFILE%\.config

* 設定ファイルのコピー

```pwsh
ghq get kazurri/dotfiles
cp "$(ghq list -p dotfiles)\.config\nvim" $HOME\.config\ -Recurse -Force
```

### Windows Terminal

* Windows Terminalのインストール

```pwsh
scoop bucket add extras
scoop install vcredist2022 windows-terminal
```

* プロファイルのコピー

```pwsh
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
