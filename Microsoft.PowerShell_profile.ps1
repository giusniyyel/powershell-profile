using namespace System.Management.Automation
using namespace System.Management.Automation.Language

if ($host.Name -eq 'ConsoleHost') {
    Import-Module PSReadLine
    
}
Import-Module -Name Terminal-Icons
oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/onedarkpro.omp.json" | Invoke-Expression

Set-PSReadLineOption -PredictionSource History

$height = (Get-Host).UI.RawUI.MaxWindowSize.Height
$width = (Get-Host).UI.RawUI.MaxWindowSize.Width

if ($width -ge 54 -and $height -ge 15) {
    Set-PSReadLineOption -PredictionViewStyle ListView -WarningAction:SilentlyContinue
} else {
    Set-PSReadLineOption -PredictionViewStyle InlineView
}
Set-PSReadLineOption -EditMode Windows

# Fuzzy Finder
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'