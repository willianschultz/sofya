# Android e iOS

Publicação em lojas não faz parte da primeira entrega. Este guia prepara o caminho para testes futuros.

## Android

1. Instale Android Studio e, pelo gerenciador de SDK, instale um Android SDK, Platform Tools, Build Tools e uma versão de JDK compatível com a Godot.
2. Na Godot, abra **Editor > Configurações do Editor > Exportar > Android** e informe os caminhos do SDK e do JDK.
3. Em **Projeto > Exportar**, adicione uma predefinição **Android**.
4. Conecte um celular com depuração USB ativada ou use um emulador.
5. Clique em **Executar no dispositivo** para testar; exporte APK para testes locais ou AAB para publicação.
6. Antes de publicar, defina identificador exclusivo do pacote, ícone, versão, política de privacidade quando aplicável e assinatura de distribuição.

Teste primeiro os controles, tamanho de texto, orientação de tela e desempenho em aparelho físico. A futura interface mobile deve ser implementada antes de considerar publicação.

## iOS

O fluxo padrão de exportação para iOS exige **macOS e Xcode**. Também é necessário ter conta Apple Developer para instalar e distribuir normalmente em dispositivos.

1. Instale a Godot e o Xcode em um Mac.
2. Em **Projeto > Exportar**, adicione uma predefinição **iOS**.
3. Configure identificador de pacote, equipe de assinatura e versão.
4. Exporte o projeto, abra o resultado no Xcode e selecione um dispositivo.
5. Teste em aparelho físico antes de enviar ao TestFlight ou App Store Connect.

Não há como executar a etapa final padrão de assinatura e publicação do iOS apenas em Windows ou Linux sem acesso a um macOS/Xcode adequado.
