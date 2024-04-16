# Windows
[![cc][cc_image]][cc_url]

my windows setting

## Version

- Windows 10 Enterprise 21H2

## Installation

### scoop

- scoopのインストール

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
iwr -useb get.scoop.sh | iex
```

- ツールのインストール

```pwsh
# must
scoop install 7zip aria2 curl
# git
scoop install git ghq
# legacy tools
scoop install gawk less sed which
# rust tools
scoop install gitui bat delta eza fd ripgrep starship bottom
# programing
scoop install python
# extras
scoop bucket add extras
scoop install putty teraterm vcxsrv
scoop install pdfarranger rufus sysinternals winmerge winscp wireshark
```

- Update & Cleanup

```pwsh
scoop update
scoop update *
scoop cleanup *
scoop cache rm *
```

## ghq

- ghq rootの設定

```pwsh
git config --global <ghq root>
```

### Powershell Core

- PowerShell Coreのインストール
  - [PowerShell](https://github.com/PowerShell/PowerShell)

- モジュールのインストール

```pwsh
Install-Module PSReadLine -Scope CurrentUser -SkipPublisherCheck -Force
Install-Module PSFzf -Scope CurrentUser -SkipPublisherCheck -Force
```

- プロファイルのコピー

```pwsh
ghq get kazurri/windows
$path = $env:USERPROFILE + "\Documents\PowerShell"
If (-not (Test-Path $path)) { mkdir $path}
cp "$(ghq list -p windows)\Microsoft.PowerShell_profile.ps1" $PROFILE -Force
```

### neovim

- neovimのインストール

```pwsh
scoop bucket add versions
scoop install neovim
```

- モジュールのインストール

```pwsh
pip install --user pynvim
```

- 環境変数の設定
  - XDG_CACHE_HOME → %USERPROFILE%\.cache
  - XDG_CONFIG_HOME → %USERPROFILE%\.config

- 設定ファイルのコピー

```pwsh
ghq get kazurri/dotfiles
cp "$(ghq list -p dotfiles)\.config\nvim" $HOME\.config\ -Recurse -Force
```

### Font

- [HackGen](https://github.com/yuru7/HackGen)
- [PlemolJP](https://github.com/yuru7/PlemolJP)

## License

[![cc][cc_image]][cc_url]

## Author

[Kazuhiro Namigata](mailto:kazurri@gmail.com)

[cc_image]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg?style=flat-square
[cc_url]: http://creativecommons.org/licenses/by/4.0/
