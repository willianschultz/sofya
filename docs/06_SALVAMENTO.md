# Salvamento

O SOFYA salva somente o último progresso alcançado. Ao atravessar o portal da fase 1, o jogo registra que a fase 2 está desbloqueada. A tela de conclusão não substitui esse progresso. Na próxima abertura, o botão **Continuar** abre diretamente a fase 2.

## Onde está a implementação

O script global `scripts/save_manager.gd` está configurado como **Autoload** em `project.godot`. Isso significa que a Godot cria um único `SaveManager` para todo o jogo. O script `scripts/main_menu.gd`, ligado à tela inicial, pergunta a esse gerenciador qual fase deve abrir ao clicar em **Continuar**.

## Onde os dados são armazenados

O arquivo é `user://savegame.json`. O prefixo `user://` representa a pasta de dados do aplicativo no computador ou celular, sem gravar dentro da pasta do projeto. Na Godot, use **Projeto > Ferramentas > Abrir Pasta de Dados do Usuário** para localizá-la.

## Informações salvas

```json
{
  "save_version": 1,
  "last_unlocked_level_path": "res://scenes/level_02.tscn"
}
```

- `save_version`: versão da estrutura do arquivo.
- `last_unlocked_level_path`: caminho da última fase desbloqueada.

## Como testar o carregamento

1. Execute o projeto e clique em **Novo jogo**.
2. Confirme que a fase 2 abriu.
3. Feche o jogo e execute-o de novo com F5.
4. O botão **Continuar** deve aparecer e abrir a fase 2.
5. Para testar o começo novamente, feche o jogo e apague `savegame.json` na Pasta de Dados do Usuário.

## Como adicionar novos campos

Adicione o valor ao dicionário `save_data` em `save_last_unlocked_level`. Ao ler, use `parsed_data.get("nome_do_campo", valor_padrao)`. Assim, arquivos antigos que ainda não possuem o novo campo continuam válidos.

## Evitar incompatibilidades futuras

Não remova nem renomeie campos já publicados sem uma migração. Aumente `SAVE_VERSION` quando a estrutura mudar. A versão atual também recusa um arquivo produzido por uma versão futura do jogo, usando o começo como alternativa segura.
