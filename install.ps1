# Constants
$TO = "$HOME\Documents\PowerShell"
$FILES = @(
    "./dart"
    "./py"
    "./rs"
    "./web"
    "./Completions-Loader.ps1"
)

Import-Module "./Completions-Loader.ps1"

foreach ($file in $FILES) {
    Copy-Item -Path $file -Destination $TO
}

Write-Output "Import the following line into your Profile.ps1"
Write-Host 'Import-Module "./Completions-Loader.ps1"' -ForegroundColor Green
