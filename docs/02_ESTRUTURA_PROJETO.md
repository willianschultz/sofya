# Estrutura do projeto

```text
SOFYA/
├── project.godot
├── README.md
├── scenes/
│   ├── main.tscn
│   └── player.tscn
├── scripts/
│   └── player.gd
└── docs/
    ├── README.md
    ├── 01_CONCEITOS_GODOT.md
    ├── 02_ESTRUTURA_PROJETO.md
    ├── 03_MOVIMENTACAO.md
    ├── 04_CRIANDO_FASES.md
    ├── 05_INTERFACE.md
    ├── 06_SALVAMENTO.md
    ├── 07_ANDROID_IOS.md
    └── 08_MANUTENCAO.md
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
**Finalidade:** fase de testes atual.  
**Responsabilidades:** posicionar a Sofya, plataformas, chão e texto de controles.  
**Relacionados:** `scenes/player.tscn`.  
**Quando modificar:** ao criar ou ajustar a fase.

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

### `docs/`

**Local:** raiz do projeto.  
**Finalidade:** explicar a Godot e as decisões do projeto em português.  
**Responsabilidades:** manter instruções atualizadas para desenvolvimento e manutenção.  
**Quando modificar:** junto com qualquer funcionalidade documentada.
