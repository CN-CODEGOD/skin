# Get baseName from path
# Usage: .\GetBaseName.ps1 -Path "C:\Users\Atri\Documents"

param(
    [Parameter(Mandatory=$true)]
    [string]$Path
)

$baseName = Split-Path -Path $Path -Leaf
Write-Output $baseName
