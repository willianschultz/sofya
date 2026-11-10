# Estrutura do projeto

```text
SOFYA/
├── project.godot
├── README.md
├── scenes/
│   ├── main.tscn
│   ├── level_02.tscn
│   ├── level_exit.tscn
│   └── player.tscn
├── scripts/
│   ├── level_exit.gd
│   ├── main.gd
│   ├── player.gd
│   └── save_manager.gd
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
    └── 09_PROXIMAS_ETAPAS.md
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

### `scenes/level_02.tscn`

**Local:** `scenes/`.  
**Finalidade:** segunda fase curta da demonstração.  
**Responsabilidades:** oferecer uma nova disposição de plataformas e a conclusão visual final.  
**Relacionados:** `scenes/main.tscn`, `scenes/level_exit.tscn` e `scenes/player.tscn`.  
**Quando modificar:** ao ajustar a segunda fase ou ao usá-la como modelo para uma fase nova.

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
**Responsabilidades:** detectar a entrada da Sofya, mostrar uma mensagem de conclusão e, quando configurada, abrir a próxima cena.
**Relacionados:** `scenes/main.tscn` e `docs/04_CRIANDO_FASES.md`.
**Quando modificar:** ao ajustar posição, aparência ou a ação que deverá ocorrer ao concluir uma fase.

### `docs/`

**Local:** raiz do projeto.  
**Finalidade:** explicar a Godot e as decisões do projeto em português.  
**Responsabilidades:** manter instruções atualizadas para desenvolvimento e manutenção.  
**Quando modificar:** junto com qualquer funcionalidade documentada.
