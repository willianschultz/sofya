# Instalação no Windows

Este guia prepara o computador para testar o SOFYA em `C:\Projetos\Sofya`.

## Forma automática

O Windows 10 ou 11 atualizado normalmente possui o `winget`. Abra o **PowerShell** e execute os comandos abaixo, um por vez:

```powershell
$setupPath = "$env:TEMP\setup_sofya.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/willianschultz/sofya/main/tools/setup_windows.ps1" -OutFile $setupPath
PowerShell -ExecutionPolicy Bypass -File $setupPath
```

O instalador faz três coisas:

1. Instala o Git, caso ele não exista.
2. Instala a Godot padrão, caso ela não exista.
3. Clona o projeto em `C:\Projetos\Sofya`.

Se essa pasta já for um repositório do SOFYA, o script atualiza a branch `main` usando `git pull --ff-only`. Ele para sem alterar arquivos se encontrar uma pasta comum ou alterações que não possam ser atualizadas com segurança.

## Forma manual

Use esta opção se o PowerShell informar que `winget` não está disponível.

1. Instale o Git para Windows em [git-scm.com/download/win](https://git-scm.com/download/win). Mantenha as opções padrão.
2. Baixe a **Godot Engine padrão** para Windows em [godotengine.org/download/windows](https://godotengine.org/download/windows). Não escolha a versão .NET; este projeto usa GDScript.
3. Abra o Git Bash ou PowerShell e execute:

```powershell
New-Item -ItemType Directory -Path C:\Projetos -Force
git clone https://github.com/willianschultz/sofya.git C:\Projetos\Sofya
```

## Abrir e testar

1. Inicie a Godot.
2. Clique em **Importar**.
3. Selecione `C:\Projetos\Sofya\project.godot`.
4. Clique em **Importar e Editar**.
5. Pressione **F5** e escolha **Novo jogo**.

Não é necessário instalar Android Studio, Xcode ou ferramentas de publicação nesta etapa.
