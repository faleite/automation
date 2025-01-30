### 🚀 **Passo a Passo para Atualizar a Imagem do n8n no Docker Compose**  

## 🔄 **1️⃣ Parar os Contêineres**
Antes de atualizar, pare o serviço n8n:  
```bash
docker-compose down
```
ou, se estiver usando a versão mais nova do Docker:
```bash
docker compose down
```

---

## 📦 **2️⃣ Remover a Imagem Antiga**
Agora, exclua a versão antiga da imagem para forçar o Docker a baixar a versão mais recente:  
```bash
docker rmi docker.n8n.io/n8nio/n8n
```
Se der erro dizendo que a imagem está em uso, use:  
```bash
docker rmi -f docker.n8n.io/n8nio/n8n
```

---

## 📥 **3️⃣ Baixar a Nova Versão da Imagem**
Agora, puxe a imagem mais recente do n8n:  
```bash
docker pull docker.n8n.io/n8nio/n8n
```
Se quiser instalar uma versão específica, substitua `latest` pelo número da versão desejada, por exemplo:  
```bash
docker pull docker.n8n.io/n8nio/n8n:1.18.1
```

---

## 📝 **4️⃣ (Opcional) Atualizar o `docker-compose.yml`**
Se quiser fixar a versão específica no `docker-compose.yml`, edite a linha:  
```yaml
image: docker.n8n.io/n8nio/n8n:1.18.1
```
Se quiser sempre usar a mais recente, mantenha apenas:  
```yaml
image: docker.n8n.io/n8nio/n8n
```
> **⚠️ Atenção:** Fixar uma versão evita problemas caso a versão `latest` tenha mudanças inesperadas.

---

## 🚀 **5️⃣ Subir os Contêineres com a Nova Imagem**
Agora, reinicie o Docker Compose para aplicar a atualização:  
```bash
docker-compose up -d
```
ou  
```bash
docker compose up -d
```

---

## ✅ **6️⃣ Verificar se a Atualização Funcionou**
Agora, confira se o n8n está rodando com a nova versão:  
```bash
docker exec -it nome_do_container n8n -v
```
(O nome do contêiner pode ser encontrado com `docker ps`)
