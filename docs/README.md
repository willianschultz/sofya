# SOFYA — guia inicial

SOFYA é um jogo de plataforma 2D. A primeira entrega contém uma fase curta de testes e uma Sofya representada por um retângulo rosa. O retângulo é proposital: permite validar controles e colisões antes de investir em arte e animações.

## Tecnologia

O projeto usa **Godot 4.6** e **GDScript**. GDScript é a linguagem própria da Godot; sua sintaxe lembra Python, mas seus conceitos de variáveis, funções e eventos também se aproximam de Delphi e JavaScript.

## Instalar a Godot

1. Acesse [godotengine.org/download](https://godotengine.org/download).
2. Baixe a versão estável 4.x para seu sistema operacional.
3. No Windows, descompacte o arquivo e execute `Godot.exe`. Não é necessário instalador.
4. No Linux ou macOS, siga a instalação indicada na página de download.

Use uma versão Godot 4.x. O projeto foi validado com Godot 4.6.

Para Windows, siga o guia detalhado em [10_INSTALACAO_WINDOWS.md](10_INSTALACAO_WINDOWS.md). Ele também oferece um instalador PowerShell que clona o projeto em `C:\Projetos\Sofya`.

## Abrir e executar

1. Abra a Godot e clique em **Importar**.
2. Selecione o arquivo `project.godot` na raiz do projeto.
3. Clique em **Importar e Editar**.
4. Para executar o jogo, pressione **F6** para a cena aberta ou **F5** para o projeto inteiro.
5. Se a Godot perguntar qual é a cena principal, escolha `scenes/main_menu.tscn`.

## Testar a fase

Execute com **F5**. Na tela inicial, clique em **Novo jogo**. Use `A`/seta esquerda e `D`/seta direita para andar, `Shift` para correr, `Espaço` para saltar e `S`/seta para baixo para agachar. Na fase 1, colete as três estrelas douradas para liberar o portal azul. O contador no alto da tela deve passar de `0/3` para `3/3`. Evite os espinhos vermelhos e o inimigo roxo que patrulha o chão: cada contato remove uma vida e devolve Sofya ao início. Após um segundo no portal, a fase 2 deve abrir. Alcance o portal azul da fase 2 para ver `Fase concluída!`. Feche e abra o jogo depois de chegar à fase 2: o botão **Continuar** deve abrir a fase 2.

## Onde localizar os principais arquivos

| Local | Finalidade |
| --- | --- |
| `project.godot` | Configuração do projeto e comandos de entrada. |
| `scenes/main_menu.tscn` | Tela inicial do jogo. |
| `scenes/main.tscn` | Fase principal de testes. |
| `scenes/level_02.tscn` | Segunda fase curta, aberta pelo portal da primeira. |
| `scenes/player.tscn` | Corpo, colisão, câmera e desenho provisório da Sofya. |
| `scripts/player.gd` | Regras de movimento da Sofya. |
| `scripts/save_manager.gd` | Salvamento do último progresso de fase. |
| `scripts/main_menu.gd` | Ações da tela inicial. |
| `scenes/level_exit.tscn` | Portal de saída usado na fase de testes. |
| `scenes/collectible.tscn` | Item coletável usado para liberar o portal da fase 1. |
| `scenes/hazard.tscn` | Espinhos que removem uma vida ao toque. |
| `scenes/enemy.tscn` | Inimigo simples que patrulha o chão. |
| `docs/` | Guias de desenvolvimento em português. |

## Como iniciar o desenvolvimento

Abra primeiro `scenes/main.tscn`, execute-a e observe a árvore de nós à esquerda. Em seguida abra `scenes/player.tscn` e selecione o nó **Player**. Os valores expostos no Inspector, como `Walk Speed`, podem ser ajustados sem alterar código. Antes de mudar qualquer valor de movimento, leia [03_MOVIMENTACAO.md](03_MOVIMENTACAO.md).

## Próximas leituras

1. [01_CONCEITOS_GODOT.md](01_CONCEITOS_GODOT.md)
2. [02_ESTRUTURA_PROJETO.md](02_ESTRUTURA_PROJETO.md)
3. [03_MOVIMENTACAO.md](03_MOVIMENTACAO.md)
4. [04_CRIANDO_FASES.md](04_CRIANDO_FASES.md)
5. [09_PROXIMAS_ETAPAS.md](09_PROXIMAS_ETAPAS.md)
6. [10_INSTALACAO_WINDOWS.md](10_INSTALACAO_WINDOWS.md)
