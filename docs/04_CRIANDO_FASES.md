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

Nesta etapa, um obstáculo simples pode ser outro `StaticBody2D`, usado como parede ou bloco. Inimigos e dano ainda não foram implementados; não adicione script de dano agora.

## 5. Adicionar itens

Itens coletáveis ainda não existem. Quando forem criados, use `Area2D` para detectar a entrada da Sofya sem bloquear seu movimento. Registre essa funcionalidade na documentação antes de incorporá-la às fases.

## 6. Configurar saída

A saída atual é a cena reutilizável `scenes/level_exit.tscn`. Ela usa um `Area2D`: ao contrário de uma plataforma, essa área detecta a Sofya sem bloqueá-la. Para adicioná-la, arraste `level_exit.tscn` do painel **Sistema de Arquivos** para a fase e posicione o portal sobre uma plataforma alcançável.

Ao ser tocada, a saída mostra `Fase concluída!` e para de detectar novas entradas. Ela ainda não troca de cena nem registra progresso; essas ações serão acrescentadas apenas quando houver mais de uma fase.

## 7. Testar

Salve com **Ctrl+S** e pressione **F6**. Teste saltos em cada plataforma, tente atravessar suas bordas e alcance o portal azul. A mensagem de conclusão deve aparecer uma única vez. Para depurar formas de colisão, use **Depurar > Formas de Colisão Visíveis** enquanto o jogo estiver sendo executado.

## 8. Adicionar ao mapa

Não há mapa de fases nesta primeira entrega. Quando existir, o mapa deverá abrir a cena pelo caminho do arquivo, como `res://scenes/level_01.tscn`. Documente a mudança em `02_ESTRUTURA_PROJETO.md` e neste guia.
