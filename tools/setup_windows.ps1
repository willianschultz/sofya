# Instala os programas necessários e prepara uma cópia local do SOFYA no Windows.
# Execute no PowerShell. O script não sobrescreve uma pasta existente que não seja Git.

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
    throw "O winget não está disponível. Siga a instalação manual em docs/10_INSTALACAO_WINDOWS.md."
}

if ($null -eq (Get-GitExecutable)) {
    Write-Host "Instalando Git..."
    winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements
}

$gitPath = Get-GitExecutable
if ($null -eq $gitPath) {
    throw "O Git foi instalado, mas ainda não está disponível. Feche o PowerShell, abra-o novamente e execute este script outra vez."
}

if ($null -eq (Get-Command godot -ErrorAction SilentlyContinue)) {
    Write-Host "Instalando Godot..."
    winget install --id GodotEngine.GodotEngine -e --source winget --accept-source-agreements --accept-package-agreements
}

$parentPath = Split-Path $projectPath -Parent
if (Test-Path $projectPath) {
    if (-not (Test-Path (Join-Path $projectPath ".git"))) {
        throw "A pasta $projectPath já existe e não é um repositório Git. Nenhum arquivo foi alterado."
    }

    Write-Host "Atualizando o projeto existente..."
    & $gitPath -C $projectPath pull --ff-only origin main
    if ($LASTEXITCODE -ne 0) {
        throw "Não foi possível atualizar o projeto. Verifique alterações locais antes de tentar novamente."
    }
}
else {
    New-Item -ItemType Directory -Path $parentPath -Force | Out-Null
    Write-Host "Clonando o projeto em $projectPath..."
    & $gitPath clone $repositoryUrl $projectPath
    if ($LASTEXITCODE -ne 0) {
        throw "Não foi possível clonar o projeto."
    }
}

Write-Host "Preparação concluída. Abra $projectPath\project.godot na Godot e pressione F5 para testar."
Start-Process explorer.exe $projectPath
