try {
    Import-Module "./.usr/gh.completion.psm1"
    Import-Module "./.usr/git.completion.psm1"
    Import-Module "./.usr/starship.completion.psm1"
    Import-Module "./.usr/zoxide.completion.psm1"
}
catch {}

Import-Module "./dart/dart.completion.psm1"
Import-Module "./dart/flutter.completion.psm1"

Import-Module "./py/pip.completion.psm1"
Import-Module "./py/poetry.completion.psm1"
Import-Module "./py/py.completion.psm1"

Import-Module "./rs/cargo.completion.ps1"
Import-Module "./rs/rustup.completion.ps1"

Import-Module "./web/nvm.completion.ps1"
Import-Module "./web/sass.completion.ps1"
Import-Module "./web/swc.completion.ps1"
Import-Module "./web/tsc.completion.ps1"
Import-Module "./web/vite.completion.ps1"

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
