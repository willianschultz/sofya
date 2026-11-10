# Salvamento

O jogo já possui duas fases, mas ainda **não salva dados**. A transição acontece somente durante a execução atual. Isso evita criar um sistema antes de validar a experiência das fases.

Quando o jogo precisar salvar progresso, use `FileAccess` da Godot para gravar um dicionário convertido em JSON no caminho `user://savegame.json`. `user://` é uma pasta própria do aplicativo e funciona em desktop e mobile.

## Informações recomendadas

Comece apenas com dados necessários, por exemplo:

```gdscript
var save_data := {
    "save_version": 1,
    "unlocked_levels": ["level_01"],
    "last_level": "level_01"
}
```

## Adicionar campos

1. Adicione um campo com valor padrão ao dicionário.
2. Ao carregar, trate a ausência do campo com `data.get("novo_campo", valor_padrao)`.
3. Aumente `save_version` se o significado de dados antigos mudar.
4. Teste salvar, fechar o jogo e abrir novamente.

## Evitar incompatibilidades

Nunca presuma que todo arquivo salvo possui todos os campos atuais. Mantenha `save_version`, use valores padrão e prefira adicionar campos a renomear ou remover dados existentes. Quando o sistema for implementado, este documento, `02_ESTRUTURA_PROJETO.md` e a documentação do script deverão ser atualizados juntos.
