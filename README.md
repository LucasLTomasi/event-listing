# Listagem de Eventos
## Características:
- MVVM
- RxSwift
- View Code
- Cocoapods

## Funcionamento:
- O app inicia com um loading enquanto os eventos estão sendo buscados;
- É mostrado um banner indicando se o usuário está sem conexão de internet, o que impossibilita a busca por eventos;
- Feita a busca, os eventos são listados pelos títulos;
- Ao clicar em uma célula a tela de detalhes do evento é exibida. Ela inclui as seguintes informações a respeito do evento: imagem, título, descrição, data e preço.

## Estrutura:
- <ins>__EventListing__</ins>: raiz do app
  - <ins>__API__</ins>: *responsável por toda a lógica de API*
    - <ins>APIClient</ins>: *faz requests HTTP*
    - <ins>APIDecoder</ins>: *decodifica as respostas*
    - <ins>APIError</ins>: *usado para mapear e diferenciar erros*
    - <ins>__Protocols__</ins>
      - <ins>APIClientProtocol</ins>: *também usado para os testes unitários*
  - <ins>__Components__</ins>: *componentes de UI reutilizáveis*
    - <ins>__Labels__</ins>
      - <ins>MultilineLabel</ins>: *label genérico que pode incluir textos grandes*
    - <ins>__StackViews__</ins>
      - <ins>TitleAndContentStackView</ins>: *utilizada para agrupar título e conteúdo na tela de detalhes*
    - <ins>__TableViews__</ins> 
      - <ins>TableView</ins>: *única table view do projeto*
    - <ins>__Views__</ins>: *views diversas e agrupamentos de views*
      - <ins>ErrorBannerView</ins>: *utilizado para exibição de erro de conexão*
  - <ins>__Extensions__</ins>
    - <ins>Double+Extensions</ins>: *utilizada para formatação do preço*
    - <ins>Int+Extensions</ins>: *utilizada para formatação da data*
    - <ins>String+Extensions</ins>: *acesso de strings centralizado*
    - <ins>UIImageView+Extensions</ins>: *utilizada para carregar uma imagem através de uma url*
  - <ins>__Managers__</ins>
    - <ins>NetworkConnectionManager</ins>: *observa e notifica mudanças na disponibilidade da conexão com a internet*
  - <ins>__Models__</ins>
    - <ins>Event</ins>: *representa um evento*
  - <ins>__Navigation__</ins>
    - <ins>Coordinator</ins>: *coordena a troca de telas*
    - <ins>ViewControllerFactory</ins>: *constrói view controllers*
  - <ins>__Scenes__</ins>: *ou screens, views, pages, etc*
    - <ins>__CommonViewModels__</ins>
      - <ins>EventViewModel</ins>: *view model que é utilizado em ambas as telas contendo todas informações do evento para serem utilizadas na tela de detalhes*
    - <ins>__EventDetail__</ins>
      - <ins>EventDetailView</ins>: *é a view da segunda tela, de detalhes do evento*
      - <ins>EventDetailViewController</ins>: *segunda tela que mostra os detalhes do evento*
    - <ins>__EventsList__</ins>
      - <ins>EventsListCoordinator</ins>: *utilizado pelo coordinator para realizar navegação a partir desta tela*
      - <ins>EventsListView</ins>: *é a view da primeira tela, de lista de eventos*
      - <ins>EventsListViewController</ins>: *primeira tela que mostra a lista de eventos*
      - <ins>EventsListViewModel</ins>: *é responsável por chamar a API para buscar eventos e pela atualização do estado da UI em decorrência disso*
    - <ins>__TableView__</ins>:
      - <ins>EventsListTableViewCell</ins>: *mostra o título do evento na lista de eventos*
  - <ins>__SupportingFiles__</ins>
    - <ins>Localizable.strings</ins>: *contém as strings que podem ser utilizadas para outros idiomas*
- <ins>__EventListingTests__</ins>:
  - <ins>__Mocks__</ins>: *utilizados por outras classes através de injeção de dependência usando protocolos*
- <ins>__EventListingUITests__</ins>
  - <ins>EventListingUITests</ins>: *testa alguns comportamentos de UI baseado em certos tipos interações* 
- <ins>__Pods__</ins>: gerenciador de dependências utilizado
    - <ins>Podfile</ins>: *definição das bibliotecas a serem utilizadas: RxSwift, RxCocoa e SwiftLint*

