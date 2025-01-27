## Elementary automation with n8n

>[to be continued...](https://youtu.be/2YfWuNziPE4?si=GhvXdQIyxDdPIW7I)

### Introduction to Automation

*O objetivo é destacar os principais temas, conceitos e práticas, com foco na compreensão da automação como ferramenta para tomada de decisões baseada em dados.*

**O que é Automação?**
- Definição: "Automação é um conjunto previsível de ações predeterminadas que transfere dados de um ponto para outro."

**Trigger (Gatilho)**
- O evento que inicia o fluxo de automação. Pode ser manual, agendado ou acionado por aplicativos (Webhooks, atualizações no CRM, envio de formulários, etc.). "Um gatilho é o que inicia uma automação."

**Filtering (Filtro)**
- Permite direcionar diferentes tipos de dados por caminhos específicos com base em condições predefinidas. Ex: "Dependendo do tipo de empresa, vamos enviar essa empresa por diferentes caminhos."

**Actions/Apps (Ações/Aplicativos)**
- Permitem interagir com aplicativos web, realizando tarefas como atualizar planilhas, enviar emails, enviar mensagens por Slack, etc. "Ações permitem que você interaja com aplicativos na web."

**O que é um Workflow?**
- A maioria dos workflows segue um padrão (Estrutura Comum):
  1. `Gatilho`: Inicia o workflow.
  2. `Processamento de Dados`: Classificação, filtragem, formatação, transformação ou segmentação dos dados.
  3. `Ações`: Execução das tarefas finais, como atualizar planilhas, enviar emails ou notificações.

**Melhores Práticas para Automação**
- `Mapeamento do Processo`
  - Antes de construir qualquer automação, é essencial mapeá-la detalhadamente. "O mapeamento de um processo antes de construí-lo irá garantir que você tenha visibilidade sobre... você tem um entendimento da tarefa."
- `Visibilidade` 
  - Permite entender a tarefa, os aplicativos necessários e a viabilidade da automação.
- `Estimativa de Carga de Trabalho`
  - Ajuda a estimar o tempo necessário para automatizar a tarefa.
- `Identificação de Intervenção Humana`
  - Revela se é necessário algum tipo de intervenção humana no fluxo de trabalho.
- `Criação de Fluxograma`
  - Use ferramentas como Miro ou FigJam para criar fluxogramas, listando cada parte do processo como um bloco e conectando-os com setas para mostrar as interações. "O que você quer fazer é listar cada parte diferente do processo como um bloco individual Em seguida, trabalhando da esquerda para a direita, você vai querer ligar esses blocos diferentes com setas, dependendo de como eles interagem."
- `Clareza no Processo`
  - Se houver qualquer incerteza durante o mapeamento do processo, é importante esclarecê-la antes de começar a construir o workflow. "Se durante o mapeamento você perceber que algo não está claro, isso é algo que você precisa entender antes de começar a construir o fluxo de trabalho."

### APIs e Webhooks
Este documento resume os principais temas e ideias apresentados no vídeo "n8n Beginner Course (2/9) - Introduction to APIs and Webhooks". O vídeo explora a natureza e os componentes de APIs (Application Programming Interfaces) e webhooks, elementos cruciais para a criação de fluxos de trabalho automatizados.

Temas Principais:

**O que é uma API?**
- Uma `API` é uma *interface de programação de aplicações* (Application Programming Interfaces) que expõe um serviço, permitindo que desenvolvedores escrevam programas para consumi-lo.
-` Analogia do Restaurante`
  - A API é comparada a um garçom em um restaurante. O cliente (você) faz um pedido (request) ao garçom (interface), que o leva à cozinha (aplicação). A cozinha prepara a comida e o garçom traz a comida de volta (response) ao cliente.
- `Abstração da Complexidade`
  - APIs abstraem a complexidade de interagir diretamente com aplicações, tornando o acesso aos dados mais fácil e eficiente. Em vez de ter que ir aos servidores e buscar dados diretamente, você usa a API para solicitar e receber as informações necessárias.
- `Documentação`
  - A documentação de uma API (equivalente a um menu de restaurante) explica como a interface funciona e os serviços disponíveis.

**Como uma API Funciona**
- `Requisições (Requests) e Respostas (Responses)`
  - A comunicação via API envolve o envio de uma requisição (request) e o recebimento de uma resposta (response).
- `Modelo Cliente-Servidor`
  - O cliente (quem faz a requisição) e o servidor (quem responde à requisição).

**Componentes de uma Requisição HTTP**
- `URL` O endereço exclusivo de um recurso na web (ex: página, imagem, dados). É composto por
  - `Esquema` (ex: http, https)
  - `Host` (ex: www.example.com)
  - `Porta` (opcional)
  - `Caminho` (ex: /api/v1/users)
  - `Parâmetros` de Consulta (opcional, sempre precedidos por "?", ex: ?sort=name&order=asc).
- `Método` A ação a ser realizada no URL. Os mais comuns são:
  - `GET` Para receber informações (ex: ler dados).
  - `POST` Para enviar informações (ex: enviar dados de formulário).
  - `Outros` (menos comuns) DELETE, PUT, PATCH.
- `Header` Contexto adicional para a requisição, como preferências de idioma, tipo de dispositivo e tipo de resposta esperada. Exemplo: Accept: application/json.
- `Body` (opcional, apenas para POST) Os dados que estão sendo enviados ao servidor. Exemplo: informações de um formulário.
- `Credenciais` Autenticação para o servidor saber que você tem permissão para realizar uma ação. As formas mais comuns são:
  - `Parâmetros de consulta` Ex: ?api_key=chave_da_api
  - `Header` Ex: Authorization: Bearer chave_da_api
  - `OAuth` Usado para "sign in with Google", etc.

**Componentes de uma Resposta HTTP**
- `Status Code` Código numérico de 3 dígitos que indica o resultado da requisição.
  - `200` (OK): Requisição bem-sucedida.
  - `401` (Unauthorized): Falha de autenticação.
  - `404` (Not Found): Recurso não encontrado no URL especificado.
  - `500` (Internal Server Error): Erro no servidor.
  - *`Regra Prática` Se começar com 2 tudo certo, com 4 tem erro na sua requisição, com 5 é um problema no servidor.*
- `Header` Contexto adicional sobre a resposta. Inclui informações como tipo de conteúdo, tamanho e validade.
- `Body` Os dados reais retornados (HTML, JSON, binário, etc).

**Webhooks**
- `Definição` Também chamados de "APIs reversas", webhooks enviam notificações quando algo acontece. São como um "campainha" que avisa quando algo específico ocorre, em vez de você ter que verificar constantemente se algo mudou.
  - `Exemplo da Campainha` Em vez de ir na porta a cada minuto para ver se seus amigos chegaram, você espera a campainha tocar.
- `Polling vs Webhook`
  - `Polling` Fazer requisições frequentes para verificar se algo aconteceu (ex: verificar a cada minuto se há um novo pagamento no Stripe).
  - `Webhook` Receber uma notificação do serviço (ex: o Stripe envia um webhook assim que um novo pagamento é feito).
- `Configuração` Requer um URL para onde a notificação será enviada (n8n pode usar seu próprio nó de webhook).

### O que são Nodes?

Nodes são blocos de construção (fundamentais no n8n).
A ideia central é que todos os workflows são construídos a partir da combinação e conexão desses nodes.

**Tipos de Nodes**
- Os nodes são categorizados em três tipos principais:
  - `Entry Points (Triggers)` Nodes que iniciam o workflow. Podem ser gatilhos manuais ou eventos de aplicativos.
  - `Functions (Action)` Nodes que transformam, filtram ou formatam dados.
  - `Exit Points (Apps)` Nodes que interagem com aplicativos e serviços externos.

**Categorização e Acesso** 

Os nodes são agrupados por tipo (Triggers, Actions in App, Data Transfer, Information, etc.) para facilitar a navegação. É possível encontrá-los na tela do n8n tanto através da barra de pesquisa como da lista de opções. Ao selecionar um node, muitas vezes, o usuário pode escolher uma ação específica (operação) que o node irá executar.

**Configurações do Node**
- `Parâmetros`: Configurações específicas para um determinado node e operação, como qual planilha e sheet usar para ler dados no Google Sheets.
  - os parâmetros que são a visualização padrão ao clicar duas vezes em um nó serão específicos para um determinado nó e operação.
- `Configurações Avançadas` Opções independentes do node, como notas, visualizações, e configurações de execução.
  - A engrenagem no canto superior direito nos dá acesso a configurações avançadas que são independentes de nós, como notas ou visuais e configurações de execução.
- `Credenciais` Configurações para autenticar e acessar aplicativos e serviços externos. As credenciais são salvas no nível da instância para permitir o compartilhamento eficiente de workflows, garantindo a segurança através do controle de acesso a elas.
  - No topo dos parâmetros para cada nó do aplicativo haverá uma opção para definir suas credenciais, este é um conceito muito importante para entender esta configuração é como nos autenticamos em diferentes aplicativos e serviços.
- `Dados de Entrada e Saída` Cada node tem dados de entrada (input) e saída (output). Essa visualização torna fácil entender o fluxo de dados no workflow, e pode ser vista em formato de tabela, JSON ou schema.
  - À esquerda e à direita dos parâmetros de notas, temos dados de entrada e saída, o que torna fácil entender quais dados estão sendo lidos como entrada pelo nó e quais são os dados de saída associados.

**Ideias e Fatos Importantes**
- `Fluxo de Dados` O n8n utiliza um fluxo visual de dados entre nodes, tornando o processo de automação mais intuitivo e fácil de entender.
- `Flexibilidade` A variedade de nodes disponíveis permite a criação de workflows complexos para diversas finalidades.
- `Reutilização` O conceito de credenciais no nível da instância facilita o compartilhamento e a reutilização de workflows entre equipes e projetos, com foco em segurança.
- `Fácil Acesso` É possível acessar a configuração de todos os nodes, permitindo a customização e a visualização de dados e logs.
- `Formatação dos Dados` Os dados podem ser visualizados em diferentes formatos (tabela, JSON, esquema) permitindo um maior controle na organização e manuseio das informações.
