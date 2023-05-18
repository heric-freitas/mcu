# Marvel

Projeto para listar filmes na ordem cronologica da marvel.

## Getting Started

- Primeiro passo: tenha o flutter instalado na sua maquina. Caso nao tenha [clique aqui](https://docs.flutter.dev/get-started/install)
- Segundo passo: tenha uma IDE configurada para o flutter, recomendo duas opções, [Android Studio](https://developer.android.com/studio?gclid=CjwKCAjw9pGjBhB-EiwAa5jl3Botj8xaOVWTeQ_ULegGS1pa6WEReQg5Mg99oBgYs68-djOoB42ZKhoCE2MQAvD_BwE&gclsrc=aw.ds) ou [Visual Studio Code](https://code.visualstudio.com/download)
- Terceiro passo: faça o clone deste projeto utilizando o [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Quarto passo abra o projeto na sua IDE e rode o projeto.

## Pacotes utilizados

Tentei utilizar o minimo possivel de pacotes e utilizar o flutter mais puro possivel.

- Flutter Bloc: Para gerenciar os estados dentro do aplicativo
- Provider: Para fazer as injeções de dependencias

## Estrutura de pastas

- lib
- main.dart: onde está o inicio do aplicativo
-- src
--- core
---- extensions
----- date_formatter.dart : uma extensions de String para facilitar a formatação de uma data para dd/MM/yyyy
----- navigator.dart : uma extensions de BuildContext para facilitar a navegação
----- size.dart : uma extensions de BuildContext para facilitar para pegar informações da tela e fazer contas sobre essas informações
--- modules
---- mcu
----- data
----- domain
----- infra
----- models
----- presenter
----- ui
----- mcu_provider.dart : fazer o controle das injeções que faz neste modulo
---- movie_details
----- data
----- domain
----- infra
----- models
----- presenter
----- ui
----- movie_detail_provider.dart : fazer o controle das injeções que faz neste modulo

