```
	 █████╗ ██╗   ██╗████████╗ ██████╗                
	██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗               
	███████║██║   ██║   ██║   ██║   ██║               
	██╔══██║██║   ██║   ██║   ██║   ██║               
	██║  ██║╚██████╔╝   ██║   ╚██████╔╝               
	╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝                
                                                  
███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║
██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
```

# N8N

## Workflow
[last](https://docs.n8n.io/courses/level-one/chapter-1/#summary)

## Iniciando n8n
```bash
docker volume create n8n_data

docker run -it --rm \
--name n8n \
-p 5678:5678 \
-e GENERIC_TIMEZONE="Europe/Lisbon" \
 -e TZ="Europe/Lisbon" \
-v n8n_data:/home/node/.n8n \
docker.n8n.io/n8nio/n8n
```
*Este comando baixará todas as imagens n8n necessárias e iniciará seu contêiner, exposto na porta `5678`. Para salvar seu trabalho entre reinicializações de contêiner, ele também monta um volume docker, `n8n_data`, para persistir seus dados localmente.*

> Você pode então acessar o n8n abrindo: http://localhost:5678

## Nós
Você pode pensar nos nós como blocos de construção que desempenham diferentes funções e, quando reunidos, formam uma máquina funcional: um fluxo de trabalho automatizado.

Um `Node` é uma etapa individual no seu fluxo de trabalho: uma que (a) carrega, (b) processa ou (c) envia dados.

Com base em sua função, o n8n classifica os nós em quatro tipos:
- Os **App** ou **Action Nodes** adicionam, removem e editam dados; solicitam e enviam dados externos; e disparam eventos em outros sistemas. Consulte a **biblioteca Action nodes** para obter uma lista completa desses nós.
- **Trigger Nodes** iniciam um fluxo de trabalho e fornecem os dados iniciais. Consulte a biblioteca **Trigger nodes** para obter uma lista completa de **trigger nodes**.
- Os **Core Nodes** podem ser nós core ou de aplicativo. Enquanto a maioria dos nós se conecta a um serviço externo específico, os nós core fornecem funcionalidades como lógica, agendamento ou chamadas de API genéricas. Consulte a biblioteca **Core Nodes** para obter uma lista completa de nós core.
- **Cluster Nodes** são grupos de nós que trabalham juntos para fornecer funcionalidade em um fluxo de trabalho. Consulte **Cluster nodes** para obter mais informações.