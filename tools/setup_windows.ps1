# Installs the required programs and prepares a local SOFYA copy on Windows.
# Run in PowerShell. An existing non-empty folder is never overwritten.

#Requires -Version 5.1

$ErrorActionPreference = "Stop"

$repositoryUrl = "https://github.com/willianschultz/sofya.git"
$projectPath = "C:\Projetos\Sofya"

function Get-GitExecutable {
    $gitCommand = Get-Command git -ErrorAction SilentlyContinue
    if ($null -ne $gitCommand) {
        return $gitCommand.Source
    }

    $knownPaths = @(
        "$env:ProgramFiles\Git\cmd\git.exe",
        "${env:ProgramFiles(x86)}\Git\cmd\git.exe"
    )

    foreach ($knownPath in $knownPaths) {
        if (Test-Path $knownPath) {
            return $knownPath
        }
    }

    return $null
}

if ($null -eq (Get-Command winget -ErrorAction SilentlyContinue)) {
    throw "winget is not available. Follow the manual installation in docs/10_INSTALACAO_WINDOWS.md."
}

if ($null -eq (Get-GitExecutable)) {
    Write-Host "Installing Git..."
    winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements
}

$gitPath = Get-GitExecutable
if ($null -eq $gitPath) {
    throw "Git was installed but is not available yet. Restart PowerShell and run this script again."
}

if ($null -eq (Get-Command godot -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Godot..."
    winget install --id GodotEngine.GodotEngine -e --source winget --accept-source-agreements --accept-package-agreements
}

$parentPath = Split-Path $projectPath -Parent
if (Test-Path $projectPath) {
    if (Test-Path (Join-Path $projectPath ".git")) {
        Write-Host "Updating the existing project..."
        & $gitPath -C $projectPath pull --ff-only origin main
        if ($LASTEXITCODE -ne 0) {
            throw "Could not update the project. Check local changes before trying again."
        }
    }
    else {
        $existingEntries = @(Get-ChildItem -LiteralPath $projectPath -Force)
        if ($existingEntries.Count -ne 0) {
            throw "The folder $projectPath exists and contains files. No files were changed."
        }

        Write-Host "Cloning the project into the empty folder $projectPath..."
        & $gitPath clone $repositoryUrl $projectPath
        if ($LASTEXITCODE -ne 0) {
            throw "Could not clone the project."
        }
    }
}
else {
    New-Item -ItemType Directory -Path $parentPath -Force | Out-Null
    Write-Host "Cloning the project into $projectPath..."
    & $gitPath clone $repositoryUrl $projectPath
    if ($LASTEXITCODE -ne 0) {
        throw "Could not clone the project."
    }
}

Write-Host "Setup complete. Open $projectPath\project.godot in Godot and press F5 to test."
Start-Process explorer.exe $projectPath
