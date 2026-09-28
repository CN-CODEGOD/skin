[CmdletBinding()]
param (
    [Parameter(Position=0)]
    [ValidateSet("cloudmusic","PotPlayerMini64","Spotify","stopall")]
    [string]$Player,

    [Parameter(Position=1)]
    [string]$Path
)

$AllPlayers = @("cloudmusic", "PotPlayerMini64", "Spotify")

function Stop-Others {
    param ([string]$Except)
    foreach ($name in $AllPlayers) {
        if ($name -ne $Except) {
            $proc = Get-Process -Name $name -ErrorAction SilentlyContinue
            if ($proc) {
                Stop-Process -Name $name -Force
                Write-Host "Stopped: $name"
            }
        }
    }
}

function Toggle-Player {
    param (
        [string]$ProcessName,
        [string]$ExePath
    )

    $proc = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue

    if ($proc) {
        Stop-Process -Name $ProcessName -Force
        Write-Host "Stopped: $ProcessName"
    } else {
        Stop-Others -Except $ProcessName
        if ($ExePath -and (Test-Path $ExePath)) {
            Start-Process $ExePath
            Write-Host "Started: $ProcessName"
        } else {
            Write-Host "Error: Path not found: $ExePath"
        }
    }
}

function Stop-All {
    foreach ($name in $AllPlayers) {
        $proc = Get-Process -Name $name -ErrorAction SilentlyContinue
        if ($proc) {
            Stop-Process -Name $name -Force
            Write-Host "Stopped: $name"
        }
    }
    Write-Host "All players stopped."
}

switch ($Player) {
    "cloudmusic"       { Toggle-Player -ProcessName "cloudmusic"       -ExePath $Path }
    "PotPlayerMini64"  { Toggle-Player -ProcessName "PotPlayerMini64"  -ExePath $Path }
    "Spotify"          { Toggle-Player -ProcessName "Spotify"          -ExePath $Path }
    "stopall"          { Stop-All }
}
