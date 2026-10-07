# install.ps1 --- Install x-emacs dependencies on Windows.
# Usage:
#   pwsh -ExecutionPolicy Bypass -File .\install.ps1
#   powershell -ExecutionPolicy Bypass -File .\install.ps1

param(
    [string]$Manifest,
    [string]$DepsDir
)

$ErrorActionPreference = 'Stop'

if (-not $Manifest) {
    $Manifest = Join-Path $PSScriptRoot 'manifest.txt'
}
if (-not $DepsDir) {
    $DepsDir = Join-Path $PSScriptRoot 'deps'
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw 'git not found in PATH.'
}

if (-not (Test-Path -LiteralPath $Manifest)) {
    throw "manifest not found: $Manifest"
}

if (-not (Test-Path -LiteralPath $DepsDir)) {
    New-Item -ItemType Directory -Path $DepsDir | Out-Null
}

Write-Host '[deps] installing dependencies...'

$urls = Get-Content -LiteralPath $Manifest |
    ForEach-Object { $_.Trim() } |
    Where-Object { $_ -ne '' }

foreach ($url in $urls) {
    $name = ($url.TrimEnd('/') -split '/')[-1]
    if ($name.EndsWith('.git')) {
        $name = $name.Substring(0, $name.Length - 4)
    }

    if ([string]::IsNullOrWhiteSpace($name)) {
        throw "cannot determine repository name from URL: $url"
    }

    $repoDir = Join-Path $DepsDir $name

    if (Test-Path -LiteralPath $repoDir) {
        Write-Host "  [update] $name"
        & git -C $repoDir pull --ff-only
        if ($LASTEXITCODE -ne 0) {
            throw "git pull failed for $name (exit code $LASTEXITCODE)"
        }
    } else {
        Write-Host "  [clone] $name"
        & git clone $url $repoDir
        if ($LASTEXITCODE -ne 0) {
            throw "git clone failed for $name (exit code $LASTEXITCODE)"
        }
    }
}

Write-Host '[deps] done'
