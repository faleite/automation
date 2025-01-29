# [n8n - lvl.1](https://youtube.com/playlist?list=PLlET0GsrLUL59YbxstZE71WszP3pVnZfI&si=xFNaYSGYLITrpRga)

## Index
* **[1. Introduction to Automation](#1-introduction-to-automation)**
* **[2. APIs and Webhooks](#2-apis-e-webhooks)**
* **[3. What are Nodes?](#3-o-que-são-nodes)**
* **[4. Data Manipulation in n8n](#4-manipulação-de-dados)**
* **[5. Essential Workflow Concepts](#5-conceitos-essenciais-de-workflow)**
* **[6. Useful Nodes for Workflows](#6-nodes-úteis-para-workflows)**
* **[7. Error Handling](#7-tratamento-de-erros)**
* **[8. Debugging](#8-debugging)**
* **[9. Collaboration and Advanced Features](#9-colaboração-e-recursos-avançados)**

### [1. Introduction to Automation](https://youtu.be/4BVTkqbn_tY?si=tmLx6qv-ALKwsQ-l)

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
  - Use ferramentas como Miro ou FigJam para criar fluxogramas, listando cada parte do processo como um bloco e conectando-os com setas para mostrar as interações. "O que você quer fazer é listar cada parte diferente do processo como um bloco individual. Em seguida, trabalhando da esquerda para a direita, você vai querer ligar esses blocos diferentes com setas, dependendo de como eles interagem."
- `Clareza no Processo`
  - Se houver qualquer incerteza durante o mapeamento do processo, é importante esclarecê-la antes de começar a construir o workflow. "Se durante o mapeamento você perceber que algo não está claro, isso é algo que você precisa entender antes de começar a construir o fluxo de trabalho."

[↑ Index ↑](#index)

### [2. APIs e Webhooks](https://youtu.be/y_cpFMF1pzk?si=ALf67xT9TdZG-QQ3)
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

[↑ Index ↑](#index)

### [3. O que são Nodes?](https://youtu.be/rCPXBkeBWCQ?si=YzrpSVeiKbeYGJ2L)

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

[↑ Index ↑](#index)

### [4. Manipulação de Dados](https://youtu.be/2YfWuNziPE4?si=SDCYSu-aoMm9QksI)

**O n8n utiliza duas `estruturas de dados` principais: JASON e LISTAS**
- `JSON (JavaScript Object Notation)` Uma estrutura de dados chave-valor, delimitada por chaves `{}`, onde cada par chave-valor é separado por vírgulas. É frequentemente usada para representar objetos e seus atributos.
- `Listas` Coleções de objetos (que podem ser de tipos diferentes ou iguais), delimitadas por colchetes `[]`, com seus elementos separados por vírgulas. As listas podem conter JSONs, números, strings, ou outros tipos de dados.
- `JSONs Aninhados (Embedded JSON)` JSONs podem conter outros JSONs como valores de suas chaves, permitindo a organização de dados complexos.
  - Exemplo: `{"location": {"country": "USA", "city": "New York"}}`

**Acessando Dados em JSON**
- Utiliza-se a notação de ponto (.) para acessar valores associados a chaves em JSONs, inclusive para JSONs aninhados.
  - Exemplo: `$.json.location.country`

**Relação entre JSONs e Tabelas**
- Um único JSON pode ser comparado a uma linha em uma tabela, com as chaves sendo os cabeçalhos das colunas e os valores os dados nas linhas. Uma lista de JSONs, portanto, pode ser representada como uma tabela.

<img src="./jason_tables.png" alt="JSONs e Tabelas" width="750"/>

**Itens no n8n**
- No n8n, os dados são manipulados como "itens". Um item é essencialmente um JSON individual. Os nós recebem e retornam listas de itens. Mesmo que um nó não tenha dados de saída, ele deve retornar uma lista contendo um JSON vazio.

**Execução de Nós por Item**
- Cada nó em um workflow geralmente é executado uma vez para cada item na lista de entrada. Este modelo de execução é fundamental para o fluxo de dados através dos workflows.
- Exceções podem ocorrer com configurações específicas, como a opção de executar um nó apenas para o primeiro item.

**Expressions**
- O n8n usa expressões para acessar e manipular dados em cada item. Expressões são escritas entre chaves `{}`.
  - Tudo entre duas chaves ou colchetes é uma expressão.
- Expressões podem incluir
  - Texto simples.
  - Variáveis de Item `$.json.value`.
  - Código `JavaScript` (para aplicar funções ou métodos aos dados do item).
  - Combinação de várias expressões e texto.

**Conceitos Chave**
- `Itens`: A unidade básica de dados manipulada pelo n8n. São sempre um JSON ou um lista de JSONs.
- `JSON`: Uma forma de organizar dados em pares chave-valor.
- `Listas`: Uma coleção de objetos (incluindo JSONs).
- `Expressões`: Mecanismo para acessar e manipular dados em cada item, usando variáveis de item, JavaScript e texto.
- `Execução por Item`: O padrão de execução dos nós, executando uma vez para cada item de entrada.

[↑ Index ↑](#index)

### [5. Conceitos Essenciais de Workflow](https://youtu.be/kkrA7tGHYNo?si=UMsHf8-cKpV0JTTa)

**Canvas (Tela Principal)**
- `Elementos` A interface principal do n8n é chamada de "canvas", onde os workflows são construídos.
- `Menu de Workflow` Localizado no topo, exibe o nome, tags e opções de configuração do workflow, como ativação, histórico de versões e configurações específicas.
- `Nós` São os blocos de construção dos workflows, representados visualmente no canvas. São considerados os "átomos" do workflow.
- `Configurações de Zoom` No canto inferior esquerdo, permite ajustar a visualização do canvas.
- `Ativação do Workflow` Permite colocar o workflow em produção, executando-o automaticamente.
>*A canvas é onde podemos ver os elementos principais do workflow... Na canvas temos os nós, que são os blocos de construção, os átomos do nosso workflow.*

**Menu de Workflow**
- `Listagem de Workflows` exibe todos os workflows na instância do n8n.
- `Filtros` permite filtrar por tags, proprietários e workflows criados pelo usuário.
- `Criação de Workflow` cada novo workflow criado tem o usuário como proprietário padrão.

**Configurações do Workflow**
- `Acessibilidade` Permite controlar quem pode acessar e modificar o workflow.
- `Workflow de Erro` Configura como erros no workflow serão tratados.
- `Execuções Salvas` Gerencia como as execuções do workflow são armazenadas.

**Nós (Nodes)**
- `Triggers (Gatilhos)` São os nós que iniciam o workflow, possuindo apenas uma saída e um ícone de raio laranja.
- `Conexão entre Nós` A sequência de nós determina o fluxo de dados do workflow.
- `Navegação` Ao clicar duas vezes em um nó, é possível ver os nós conectados antes e depois dele.
>*Cada workflow começa com um trigger node. Você pode reconhecê-los pelo fato de eles terem apenas uma saída... O trigger é o que inicia o workflow.*

**Ramificações (Branches)**
- `Importância` Essenciais para criar workflows complexos, permitindo diferentes caminhos ou ações baseados em condições.
  - `Tipos de Ramificação` Nós com Múltiplas Saídas: 
    - Como o nó `if`, cada item de entrada segue apenas uma das saídas condicionais ("true" ou "false").
- `Múltiplas Linhas de Saída de um Nó` Cada item é duplicado e segue todos os caminhos de saída.
>*Ramificações são muito importantes quando construímos workflows complexos... São como criamos diferentes caminhos e ações, dependendo das condições.*

**Principais Aprendizados**
- `Workflow como Fluxo de Dados` Um workflow é essencialmente um fluxo de dados entre nós, com triggers iniciando o processo.
- `Importância dos Triggers` Os triggers são o ponto de partida para a execução automatizada dos workflows.
- `Ramificações para Lógica Condicional` As ramificações são fundamentais para criar workflows que lidem com diferentes cenários e condições.
- `Diferentes Tipos de Ramificações` É importante entender como cada tipo de ramificação afeta o fluxo dos dados.
- `Ativação do Workflow` Um workflow deve ser ativado para que seja executado automaticamente, seguindo as configurações de seus triggers.

[↑ Index ↑](#index)

### [6. Nodes Úteis para Workflows](https://youtu.be/Rmi-ckbMOQE?si=_bN0zyUn_S96E5LK)

**Nodes para Manipulação de Dados**
- `Edit Fields Node (Set Node)` Este módulo é crucial para gerenciar dados dentro de cada item (linha de informação). Permite:
  - `Limpar dados`, removendo campos desnecessários e mantendo apenas o relevante.
  - `Adicionar`, formatar ou reduzir dados.
  - `Controlar` os campos incluídos na saída (manter apenas os definidos ou incluir todos os campos de entrada).
>*O nó do campo de edição é útil para gerenciar dados em seus itens, por exemplo, isso vai limpar os dados que estamos usando no momento no fluxo de trabalho, mas também pode ser usado para adicionar formato, reduzir ou adicionar quaisquer dados que estejam nos itens.*

**Nodes para Agregação de Dados**
- `Aggregate Node` Este módulo permite combinar dados de múltiplos itens em um único item. Ele é essencial para:
  - Consolidar informações de várias fontes.
  - Realizar operações de agregação (como agrupar e-mails de todas as inscrições).
- Exemplo: No workflow, o aggregate node pode ser usado para reunir todos os e-mails e nomes de empresa em listas, facilitando o envio de um resumo através do Slack.
> *Este especificamente é usado para agregar dados em todos os itens neste exemplo, vemos que temos dois itens de entrada, cada pessoa tem seu e-mail e podemos agregar no campo de e-mail e pegar esses dois itens e transformá-los em um único item de saída que contém todos os e-mails de todos os itens de entrada.*

**Nodes para Acionamento (Triggers) de Workflows**
- `Webhook Node` Este módulo permite que workflows sejam iniciados por eventos HTTP externos. Ele oferece:
  - Um URL de teste e um URL de produção que podem ser usados para receber webhooks.
  - A capacidade de automatizar workflows baseados em dados recebidos por webhook (por exemplo, dados de formulários, APIs, etc.)
- Exemplo: Um script em Python enviando dados para o URL de teste do webhook, que então dispara o workflow.
>*Quando esse nó de gatilho for adicionado à sua tela, você receberá uma URL, aqui, sob a URL de teste e a URL de produção, que você pode modificar se desejar ao testar esta etapa ou, quando o fluxo de trabalho for ativado, ele ouvirá a URL de teste ou a URL de produção para web hooks de entrada e, em seguida, executará o fluxo de trabalho com os dados recebidos do web hook como dados iniciais.*

**Conceito de Execução por Item**
- n8n executa cada node individualmente para cada item de dados, essa característica pode ser explorada para enviar mensagens individuais para cada item, por exemplo, ou agrega-los em uma única mensagem. A escolha de agregar ou não os dados vai depender do caso de uso.

**Branching Lógica com If Node**
- O nó `if` é essencial para criar ramificações lógicas em workflows, permitindo que diferentes ações sejam tomadas com base em condições específicas. Ele é útil para:
  - `Filtrar` dados com base em condições.
  - `Enviar` mensagens específicas com base em critérios.
  - `Executar` diferentes ações com base em variáveis ou dados de entrada.

[↑ Index ↑](#index)

### [7. Tratamento de erros](https://youtu.be/XEUVl3bbMhI?si=zUIfQSVAiU4qzAoN)

**Histórico de Execuções (Execution Log)**
- `Tipos de Execuções`
  - `Execuções Manuais` Iniciadas manualmente através do botão "Execute workflow" ou "Test step". Por padrão, não são salvas no log, mas essa opção pode ser habilitada por workflow.
  - `Execuções Automáticas` Iniciadas por triggers (gatilhos) quando um workflow é ativado. Estas são sempre salvas no log de execuções.
- `Acesso e Visualização` O log de execuções ("all executions") permite visualizar todas as execuções de workflows (bem-sucedidas e falhas), com opções de filtro por status, datas e dados de execução.
- `Detalhes da Execução` Cada execução armazena o estado final de cada nó do workflow, permitindo a inspeção de inputs, outputs, configurações e erros. Essa característica é crucial para debugging e compreensão do fluxo de trabalho.

**Gestão de Erros**
- `Importância` O tratamento de erros é essencial para garantir a robustez e confiabilidade dos workflows, especialmente quando ativados em produção.
- `Causas de Erro` Erros podem ocorrer devido a configurações incorretas, formatos de dados inválidos ou falhas em integrações com serviços externos.
- `Métodos de Tratamento de Erros`
  - `Error Workflow` Um workflow especial que é acionado automaticamente quando um erro ocorre em outro workflow. É configurável por workflow e permite reportar erros.
  - `Nó "Stop and Error` Um nó que permite gerar erros customizados, acionando o workflow de erros. Útil para lidar com casos excepcionais e validações.
>*O primeiro método de lidar com erros, e este é muito importante, é usar o `Error Workflow`. O `Error Workflow` é um fluxo de trabalho que é executado assim que um nó tem um erro, e este fluxo de trabalho permite que você relate quaisquer fluxos de trabalho que tenham erros.*

**`Error Workflow`**
- `Criação` Utiliza o nó `Error Trigger` para receber informações detalhadas sobre o erro, como workflow ID, nome, execution ID, URL da execução e detalhes do nó que gerou o erro.
- `Ações` O objetivo principal do workflow de erro é notificar os responsáveis pela manutenção do workflow através de canais de comunicação (Slack, e-mail, etc.). Isso garante uma resposta rápida a problemas em workflows ativos.
- `Exemplo`: A criação de um workflow simples que envia uma mensagem para um canal do Slack com informações sobre o erro, incluindo um link para a execução específica com o problema.
>*Recomendamos sempre ter um lugar, geralmente um canal, que pode ser Slack, WhatsApp, Teams ou qualquer ferramenta de comunicação onde você possa relatar erros.*

**`Nó "Stop and Error`**
- `Funcionamento` Permite criar mensagens de erro customizadas e interromper a execução do workflow.
- `Uso` É utilizado para lidar com casos excepcionais, como dados de entrada inválidos. Por exemplo, validar o formato de e-mail ou o tipo de evento recebido por um webhook.
- `Configuração` Permite controlar o comportamento do workflow em caso de erro: parar a execução, continuar ou continuar com um output de erro.
>*Você pode usar isso para gerenciar casos extremos em seus fluxos de trabalho, gerando erros quando certas condições que não deveriam ser atendidas são atendidas.*

**Caso de uso**
- `Validações` Valida se o e-mail contém um "@" (validação básica) e se o tipo de evento é válido.
- `Nós "Stop and Error` Utilizados para interromper o fluxo em caso de dados inválidos, direcionando o workflow de erro.

[↑ Index ↑](#index)

### [8. Debugging](https://youtu.be/Gxe_RfCRH-o?si=KBIyJD8w2BGBVWMA)

**O que é Depuração (Debugging)**
- A depuração é o processo de identificar e corrigir erros em workflows que impedem sua execução correta.
- Os erros podem ocorrer por diversas razões, como configuração incorreta de nós, indisponibilidade de serviços (ex: Google Sheets, Slack) ou dados de entrada inválidos (ex: webhook sem informações).
- A falha de um nó geralmente interrompe a execução do workflow e marca o status como "failed".
- É importante ressaltar que um workflow pode não ter erros formais mas ainda assim falhar em realizar o objetivo esperado, tornando o tratamento de erros crucial.

**Ferramentas de Depuração**
- `Debug in Editor (Depurar no Editor)` Permite "fixar" (pin) os dados de uma execução falha no editor do workflow, facilitando a identificação da causa do erro. 
  - >A maneira mais fácil de depurar bugs em seus fluxos de trabalho é usar o recurso de depuração no editor do n8n".
  - `Os dados fixados são indicados por um símbolo azul ou roxo no canto inferior direito do nó.
  - `Só pode haver um conjunto de dados fixados por vez.
- `Retry (Tentar Novamente)` Permite reexecutar as execuções que falharam. É possível escolher entre usar a versão atual do workflow ou a versão original da execução falha. A reexecução começa do nó onde ocorreu o erro.
- `Edit Output (Editar Saída)` Permite editar manualmente a saída de um nó específico. É útil para testar workflows, especialmente com webhooks, sem precisar executar todos os nós anteriores, porém não é uma solução escalável.
- `Workflow Version History (Histórico de Versões do Workflow)` Permite visualizar e reverter para versões anteriores do workflow, caso mudanças recentes tenham causado problemas.
  - >Ao fazer atualizações em fluxos de trabalho, tratamento de erros ou depuração, às vezes cometemos erros e podemos perder de vista onde começamos. Felizmente, temos o histórico de versões do fluxo de trabalho".

**Exemplos de Depuração**

`Exemplo 1`: 
- Webhook sem ID: O primeiro exemplo demonstra um workflow que recebe um webhook, busca informações em uma planilha do Google Sheets com base em um ID e envia uma mensagem no Slack. O erro ocorre quando o webhook não possui um ID, causando uma falha na leitura da propriedade. A solução envolve a adição de condições para verificar se o ID ou um email estão presentes no webhook e usar o valor correto para buscar na planilha. Foi abordado o uso do nó `Stop and throw error` para casos onde nem ID nem email são encontrados. 
>Este seria um ótimo lugar para usar o `nó Stop and throw error` um aqui e uma pequena mensagem sem ID ou e-mail.

`Exemplo 2:`
- Consulta sem Retorno: O segundo exemplo mostra um caso onde o workflow não "falha", mas não produz o resultado esperado. A consulta à planilha do Google Sheets não retorna nenhum resultado, causando a ausência de mensagem no Slack. A solução envolve a configuração do nó de consulta para sempre gerar uma saída (mesmo vazia) e adicionar verificações condicionais antes do nó que envia a mensagem no Slack. Foi abordado o uso do nó `Stop and throw error` para lidar com o caso onde não há email correspondente.
>Podemos definir `Sorry` indo até as configurações, podemos pedir para sempre exibir dados e isso significa que mesmo que não encontre um contato aqui, teremos aqui as informações de um item vazio.

[↑ Index ↑](#index)

### [9. Colaboração e Recursos Avançados](https://youtu.be/pI0W-0Qcwmo?si=Qm0LHQBS6vy1wAcD)

**Comunidade n8n**
- A comunidade é um dos grandes diferenciais do n8n, sendo ativa e responsiva.
- É um local para encontrar anúncios, informações sobre novas funcionalidades, solicitar recursos, reportar bugs e participar de eventos.
- O suporte é rápido, minimizando o tempo de inatividade durante a criação de workflows.
- A comunidade também contribui para uma biblioteca de templates.
>A comunidade é um ótimo lugar para encontrar informações sobre anúncios e recursos futuros ou, por exemplo, para solicitar novos recursos.

**Templates de Workflow**
- A biblioteca de templates oferece soluções prontas para problemas comuns de automação.
- Os templates abrangem desde a criação de endpoints de API até backups para GitHub, chatbots e extração de texto de PDFs.
- Disponível em n8n.io/workflows ou diretamente na interface do n8n.
- Permite buscar templates por categoria, nome ou tipo de nó.
- Usuários podem submeter seus próprios workflows como templates.
>Os modelos abrangem uma ampla gama de problemas comuns de automação que estão sendo resolvidos com o n8n.

**Gerenciamento de Usuários**
- Existem três níveis de usuários: Owner (Proprietário), Admin (Administrador) e Member (Membro).
- Cada nível tem diferentes permissões de acesso a workflows e credenciais.
- O `Owner` possui todos os direitos, mas não pode acessar informações sensíveis como API keys.
  - >Mesmo que tenham acesso a todos os fluxos de trabalho e credenciais, eles não conseguirão ler as informações confidenciais.
- `Admins` têm direitos semelhantes aos `Owners`, exceto para gerenciamento do dashboard da nuvem e alterações de papéis de Owner.
- `Members` são usuários padrão que gerenciam suas próprias contas, workflows e configurações.

**Compartilhamento de Workflow**
- Usuários podem compartilhar workflows com outros membros da mesma instância do n8n.
- Apenas usuários relevantes devem ter acesso a um workflow para evitar alterações indesejadas.
- Existem dois papéis de workflow: Creator (Criador) e Editor.
- O Criador é quem criou o workflow.
- Editores têm acesso para fazer alterações.
- O compartilhamento de um workflow automaticamente compartilha as credenciais utilizadas nesse workflow, mesmo que o editor não tenha acesso direto a elas.
>O compartilhamento de fluxo de trabalho permite que os editores usem todas as credenciais usadas em um determinado fluxo de trabalho.

**Compartilhamento de Credenciais**
- Permite compartilhar credenciais criadas com outros usuários na mesma instância.
- Usuários compartilhados podem usar as credenciais em seus workflows, mas não podem acessar ou editar os detalhes da credencial (API keys, tokens etc.).
  - >Isso é muito importante para garantir a segurança, o que significa que ninguém pode extrair o token do aplicativo ou a chave da API das credenciais e usá-los em outro lugar.
- Donos de instâncias e administradores podem compartilhar todas as credenciais, mas sem acesso aos dados subjacentes.
- O compartilhamento é feito via configurações da credencial no menu esquerdo.

**API do n8n**
- A API do n8n permite gerenciar workflows por meio do próprio n8n ou programas externos.
  - >Permite que você conheça dois casos de uso principais: o primeiro é usar o nó n8n para gerenciar outros fluxos de trabalho n8n e o segundo caso de uso é acessar, criar, editar fluxos de trabalho n8n de programas externos.
- A API é acessada via chave API gerada nas configurações da plataforma.
- Possui endpoints para obter logs de execução, criar/editar workflows, e gerenciar credenciais.
- O nó n8n oferece funções similares à API para uso dentro de workflows, útil para agendamento condicional de workflows.
  - Ex: Ativar/desativar um workflow em horários específicos.
- A ferramenta também conta com um recurso para gerar logs de segurança para auditorias.

[↑ Index ↑](#index)