# Próximas etapas

Este arquivo registra a sequência de trabalho para que o projeto possa ser retomado sem depender de memória da conversa.

## Estado atual

A fase de testes possui movimentação, plataformas, câmera e saída visual. O portal apenas confirma a conclusão; não troca de fase nem salva dados.

## Próxima validação necessária

Antes de expandir sistemas, faça o teste manual descrito em `README.md`: confirme comandos, colisões, câmera e portal. Anote qualquer comportamento estranho, principalmente no salto e no agachamento.

## Próxima implementação sugerida

Após a validação manual, criar uma segunda fase curta e fazer o portal abrir essa fase. Essa etapa deve incluir somente:

1. `level_01.tscn` e uma cópia simples para a segunda fase.
2. Uma transição explícita entre cenas.
3. Atualização do guia de criação de fases.

O sistema de salvamento só deve ser iniciado quando houver fases concluídas para registrar. Inimigos, animações definitivas, mapas complexos e controles mobile permanecem fora desta sequência até que a base seja aprovada.
