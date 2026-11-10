# Criando fases

## 1. Abrir uma fase

Na aba **Sistema de Arquivos**, dê dois cliques em `scenes/main.tscn`. A árvore de nós mostra chão, plataformas, Sofya e interface.

## 2. Duplicar uma fase

Clique com o botão direito em `main.tscn`, escolha **Duplicar** e use um nome claro, como `level_01.tscn`. Abra a cópia e, em **Projeto > Configurações do Projeto > Aplicação**, altere `Run/Main Scene` somente quando quiser que ela seja a fase inicial.

## 3. Adicionar plataformas

1. Selecione `Main` e adicione um nó `StaticBody2D`.
2. Adicione como filho um `Polygon2D` para o desenho provisório.
3. Adicione outro filho `CollisionShape2D`.
4. No Inspector do `CollisionShape2D`, crie um `RectangleShape2D` em **Shape** e ajuste **Size**.
5. Posicione o `StaticBody2D` e execute a cena.

O desenho e a colisão devem ter dimensões equivalentes. Para começar, copie uma plataforma existente e altere sua posição e tamanho no Inspector.

## 4. Adicionar obstáculos

O obstáculo atual é a cena `scenes/hazard.tscn`, formada por um `Area2D`. Arraste-a para a fase e posicione-a sobre o chão ou entre plataformas. Ao tocar os espinhos, Sofya perde uma vida e volta ao início da fase.

Para que o dano funcione, conecte o sinal `player_touched` do obstáculo no script da fase. Em `main.gd`, essa conexão atualiza as vidas e reinicia a fase quando elas acabam. Isto é um obstáculo simples, não um sistema de inimigo; mantenha inimigos para uma etapa posterior.

## 5. Adicionar itens

O item atual é a cena reutilizável `scenes/collectible.tscn`. Ela usa um `Area2D`, portanto detecta a Sofya sem bloquear seu movimento. Para adicioná-lo, arraste `collectible.tscn` para a fase e posicione-o em um local alcançável.

Na fase 1, as três estrelas douradas emitem o sinal `collected`. O script `main.gd` recebe cada sinal, atualiza o contador do objetivo e libera o portal após a última coleta. Para criar outro efeito, conecte o sinal no script da fase que contém o item, sem colocar regra específica de cada fase no `collectible.gd`.

## 6. Configurar saída

A saída atual é a cena reutilizável `scenes/level_exit.tscn`. Ela usa um `Area2D`: ao contrário de uma plataforma, essa área detecta a Sofya sem bloqueá-la. Para adicioná-la, arraste `level_exit.tscn` do painel **Sistema de Arquivos** para a fase e posicione o portal sobre uma plataforma alcançável.

Ao ser tocada, a saída mostra `Fase concluída!` e para de detectar novas entradas. No Inspector do nó `LevelExit`, o campo **Next Scene Path** recebe a próxima fase. Em `main.tscn`, ele aponta para `res://scenes/level_02.tscn`; após um segundo, a Godot abre essa cena. O campo **Requires Collectible** exige que um item libere o portal. Deixe o campo vazio na última fase para apenas mostrar a conclusão.

## 7. Testar

Salve com **Ctrl+S** e pressione **F6**. Teste saltos em cada plataforma, tente atravessar suas bordas, colete os itens necessários e alcance o portal azul. Na fase 1, o portal deve permanecer cinza até as três estrelas serem coletadas; depois, a fase 2 deve abrir após um segundo. Na última fase, a mensagem de conclusão deve aparecer uma única vez. Para depurar formas de colisão, use **Depurar > Formas de Colisão Visíveis** enquanto o jogo estiver sendo executado.

## 8. Adicionar ao mapa

Não há mapa de fases nesta primeira entrega. Quando existir, o mapa deverá abrir a cena pelo caminho do arquivo, como `res://scenes/level_01.tscn`. Documente a mudança em `02_ESTRUTURA_PROJETO.md` e neste guia.
