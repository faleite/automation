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
- Use o script n8n-docker.sh para iniciar o n8n em um contêiner docker

*Este comando baixará todas as imagens n8n necessárias e iniciará seu contêiner, exposto na porta `5678`. Para salvar seu trabalho entre reinicializações de contêiner, ele também monta um volume docker: `n8n_data` se nao houver, para persistir seus dados localmente.*

> Você pode então acessar o n8n abrindo: http://localhost:5678

## Executar comandos via CLI
*Exemplo:*
```bash
docker exec -u node -it n8n n8n license:info # Onde `n8n license:info` é um comando n8n
```
- mais comandos em [cli-commands](https://docs.n8n.io/hosting/cli-commands/)

## Nós
Você pode pensar nos nós como blocos de construção que desempenham diferentes funções e, quando reunidos, formam uma máquina funcional: um fluxo de trabalho automatizado.

Um `Node` é uma etapa individual no seu fluxo de trabalho: uma que (a) carrega, (b) processa ou (c) envia dados.

Com base em sua função, o n8n classifica os nós em quatro tipos:
- Os **App** ou **Action Nodes** adicionam, removem e editam dados; solicitam e enviam dados externos; e disparam eventos em outros sistemas. Consulte a **biblioteca Action nodes** para obter uma lista completa desses nós.
- **Trigger Nodes** iniciam um fluxo de trabalho e fornecem os dados iniciais. Consulte a biblioteca **Trigger nodes** para obter uma lista completa de **trigger nodes**.
- Os **Core Nodes** podem ser nós core ou de aplicativo. Enquanto a maioria dos nós se conecta a um serviço externo específico, os nós core fornecem funcionalidades como lógica, agendamento ou chamadas de API genéricas. Consulte a biblioteca **Core Nodes** para obter uma lista completa de nós core.
- **Cluster Nodes** são grupos de nós que trabalham juntos para fornecer funcionalidade em um fluxo de trabalho. Consulte **Cluster nodes** para obter mais informações.

## Register a phone number
  ```bash
curl -i -X POST \
  'https://graph.facebook.com/v20.0/<phone_number_id>/register' \
  -H 'Content-Type: application/json' \
  -d '{\"messaging_product\": \"whatsapp\",
    	\"pin": \"000000\",
   		\"data_localization_region\": \"+351\"}"
```

```bash
curl -i -X POST \
  'https://graph.facebook.com/v21.0/<phone_number_id>/register' \
  -H 'Content-Type: application/json' \
  -d '{
    "messaging_product": "whatsapp",
    "cc": "+351",
    "phone_number": "",
    "method": "sms" or "voice",
    "cert": <cert>,
  	"pin": "000000"
  }'
```

```bash
curl -i -X POST \
  'https://graph.facebook.com/v21.0/<phone_number_id>/messages' \
  -H 'Authorization: Bearer <token_number>' \
  -H 'Content-Type: application/json' \
  -d '{
    "messaging_product": "whatsapp",
    "to": "<phone_number>",
    "type": "template",
    "template": {
      "name": "hello_world",
      "language": {
        "code": "en_US"
      }
    }
  }'
```


## Referências
- [How do you Get and Post from Whatsapp API](https://youtu.be/LKbAoSebZuk?si=QVN97OWMS02QC-Bg) `video` 