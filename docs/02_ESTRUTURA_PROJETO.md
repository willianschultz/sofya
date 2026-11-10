# Estrutura do projeto

```text
SOFYA/
├── project.godot
├── README.md
├── scenes/
│   ├── main.tscn
│   ├── main_menu.tscn
│   ├── collectible.tscn
│   ├── enemy.tscn
│   ├── hazard.tscn
│   ├── level_02.tscn
│   ├── level_exit.tscn
│   └── player.tscn
├── scripts/
│   ├── collectible.gd
│   ├── enemy.gd
│   ├── hazard.gd
│   ├── level_exit.gd
│   ├── main.gd
│   ├── main_menu.gd
│   ├── player.gd
│   └── save_manager.gd
├── tools/
│   └── setup_windows.ps1
└── docs/
    ├── README.md
    ├── 01_CONCEITOS_GODOT.md
    ├── 02_ESTRUTURA_PROJETO.md
    ├── 03_MOVIMENTACAO.md
    ├── 04_CRIANDO_FASES.md
    ├── 05_INTERFACE.md
    ├── 06_SALVAMENTO.md
    ├── 07_ANDROID_IOS.md
    ├── 08_MANUTENCAO.md
    ├── 09_PROXIMAS_ETAPAS.md
    └── 10_INSTALACAO_WINDOWS.md
```

## Arquivos relevantes

### `project.godot`

**Local:** raiz do projeto.  
**Finalidade:** configura a janela, a cena inicial e os comandos.  
**Responsabilidades:** iniciar `main.tscn` e mapear teclado para nomes como `move_left`.  
**Relacionados:** `scripts/player.gd`.  
**Quando modificar:** ao mudar resolução, cena principal ou comandos.

### `scenes/main.tscn`

**Local:** `scenes/`.  
**Finalidade:** primeira fase de testes.  
**Responsabilidades:** posicionar a Sofya, plataformas, chão, texto de controles e transição para a fase 2.  
**Relacionados:** `scenes/player.tscn`.  
**Quando modificar:** ao criar ou ajustar a fase.

### `scenes/main_menu.tscn` e `scripts/main_menu.gd`

**Local:** `scenes/` e `scripts/`.
**Finalidade:** apresentar o primeiro ponto de interação do jogo.
**Responsabilidades:** iniciar jogo novo, continuar progresso salvo e solicitar confirmação antes de apagar esse progresso.
**Relacionados:** `project.godot`, `scripts/save_manager.gd` e `docs/05_INTERFACE.md`.
**Quando modificar:** ao alterar opções da tela inicial ou o fluxo de entrada no jogo.

### `scenes/level_02.tscn`

**Local:** `scenes/`.  
**Finalidade:** segunda fase curta da demonstração.  
**Responsabilidades:** oferecer uma nova disposição de plataformas e a conclusão visual final.  
**Relacionados:** `scenes/main.tscn`, `scenes/level_exit.tscn` e `scenes/player.tscn`.  
**Quando modificar:** ao ajustar a segunda fase ou ao usá-la como modelo para uma fase nova.

### `scenes/collectible.tscn` e `scripts/collectible.gd`

**Local:** `scenes/` e `scripts/`.
**Finalidade:** representar um item que a Sofya pode coletar.
**Responsabilidades:** detectar a Sofya, emitir o sinal `collected` e desaparecer após a coleta.
**Relacionados:** `scenes/main.tscn`, `scripts/main.gd` e `docs/04_CRIANDO_FASES.md`.
**Quando modificar:** ao adicionar tipos de item ou alterar o efeito de uma coleta.

### `scenes/hazard.tscn` e `scripts/hazard.gd`

**Local:** `scenes/` e `scripts/`.
**Finalidade:** representar um obstáculo de contato, atualmente os espinhos.
**Responsabilidades:** detectar a Sofya e avisar a fase sobre o dano.
**Relacionados:** `scenes/main.tscn`, `scripts/main.gd` e `scripts/player.gd`.
**Quando modificar:** ao ajustar área de dano, aparência ou adicionar outro tipo simples de obstáculo.

### `scenes/enemy.tscn` e `scripts/enemy.gd`

**Local:** `scenes/` e `scripts/`.
**Finalidade:** disponibilizar um inimigo de patrulha simples.
**Responsabilidades:** andar entre dois limites e causar dano pelo contato.
**Relacionados:** `scenes/main.tscn`, `scripts/main.gd` e `scripts/player.gd`.
**Quando modificar:** ao alterar velocidade, distância de patrulha ou criar outro tipo de inimigo.

### `scenes/player.tscn`

**Local:** `scenes/`.  
**Finalidade:** definir a estrutura visual e física da Sofya.  
**Responsabilidades:** reunir corpo, retângulo provisório, colisão, câmera e verificação acima da cabeça.  
**Relacionados:** `scripts/player.gd`.  
**Quando modificar:** ao trocar o sprite, a câmera ou a forma física.

### `scripts/player.gd`

**Local:** `scripts/`.  
**Finalidade:** controlar a movimentação da Sofya.  
**Responsabilidades:** ler comandos, aplicar gravidade, andar, correr, saltar e agachar.  
**Relacionados:** `scenes/player.tscn` e `docs/03_MOVIMENTACAO.md`.  
**Quando modificar:** ao alterar regras de movimento.

### `scripts/main.gd` e `scripts/save_manager.gd`

**Local:** `scripts/`.
**Finalidade:** abrir o último progresso e guardar a fase desbloqueada.
**Responsabilidades:** `main.gd` consulta o progresso ao iniciar; `save_manager.gd` lê e grava o arquivo JSON.
**Relacionados:** `project.godot`, `scenes/main.tscn`, `scripts/level_exit.gd` e `docs/06_SALVAMENTO.md`.
**Quando modificar:** ao adicionar novos dados persistentes ou mudar a forma de iniciar o jogo.

### `scenes/level_exit.tscn` e `scripts/level_exit.gd`

**Local:** `scenes/` e `scripts/`.
**Finalidade:** disponibilizar e controlar o portal de saída.
**Responsabilidades:** detectar a entrada da Sofya, permanecer bloqueada quando exigir item, mostrar uma mensagem de conclusão e, quando configurada, abrir a próxima cena.
**Relacionados:** `scenes/main.tscn` e `docs/04_CRIANDO_FASES.md`.
**Quando modificar:** ao ajustar posição, aparência ou a ação que deverá ocorrer ao concluir uma fase.

### `docs/`

**Local:** raiz do projeto.  
**Finalidade:** explicar a Godot e as decisões do projeto em português.  
**Responsabilidades:** manter instruções atualizadas para desenvolvimento e manutenção.  
**Quando modificar:** junto com qualquer funcionalidade documentada.

### `tools/setup_windows.ps1`

**Local:** `tools/`.
**Finalidade:** instalar Git e Godot no Windows e clonar ou atualizar o projeto local.
**Responsabilidades:** usar o gerenciador `winget`, proteger uma pasta que não seja repositório e abrir a pasta preparada.
**Relacionados:** `docs/10_INSTALACAO_WINDOWS.md`.
**Quando modificar:** ao mudar programas necessários ou o endereço oficial do repositório.
