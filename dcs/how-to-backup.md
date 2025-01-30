# 🛠 **Como Fazer Backup da Imagem e dos Dados do n8n no Docker**  

## 📌 **1️⃣ Backup da Imagem Docker**  
Caso queira salvar a versão atual da imagem antes de atualizar, siga estes passos:  

### 🔹 **1.1 Salvar a imagem em um arquivo .tar**  
```bash
docker save -o backup_n8n.tar docker.n8n.io/n8nio/n8n
```
Isso cria um arquivo `backup_n8n.tar` contendo a imagem atual do n8n.  

### 🔹 **1.2 Restaurar a imagem caso necessário**  
Se algo der errado e você precisar restaurar a imagem antiga, use:  
```bash
docker load -i backup_n8n.tar
```
Isso reimporta a imagem para o Docker.

---

## 📂 **2️⃣ Backup dos Dados (Volumes Docker)**  
O n8n armazena os dados no volume `n8n_data`, então é essencial copiá-los antes de atualizar.  

### 🔹 **2.1 Identificar o Caminho do Volume**  
Execute este comando para ver onde o volume `n8n_data` está salvo no sistema:  
```bash
docker volume inspect n8n_data
```
O retorno será algo como:  
```json
"Mountpoint": "/var/lib/docker/volumes/n8n_data/_data"
```
O caminho real no seu host pode variar.

### 🔹 **2.2 Copiar os dados para um backup**  
Agora, copie a pasta para um local seguro:  
```bash
sudo cp -r /var/lib/docker/volumes/n8n_data/_data /home/ubuntu/backup_n8n_data
```
Se quiser compactar o backup:  
```bash
tar -czvf backup_n8n_data.tar.gz /home/ubuntu/backup_n8n_data
```

### 🔹 **2.3 Restaurar os Dados do Backup**  
Se precisar restaurar o volume depois de uma falha, use:  
```bash
sudo cp -r /home/ubuntu/backup_n8n_data /var/lib/docker/volumes/n8n_data/_data
```
ou, se estiver compactado:  
```bash
tar -xzvf backup_n8n_data.tar.gz -C /var/lib/docker/volumes/n8n_data/_data
```

---

## 🔄 **Backup dos Arquivos em `/home/ubuntu/n8n`**  
Se você estiver armazenando arquivos extras (como uploads), também deve fazer backup da pasta `/home/ubuntu/n8n`:  
```bash
tar -czvf backup_n8n_files.tar.gz /home/ubuntu/n8n
```
Para restaurar:  
```bash
tar -xzvf backup_n8n_files.tar.gz -C /home/ubuntu/n8n
```

---

## ✅ **Checklist Antes de Atualizar o n8n**
✔ Parar os contêineres:  
```bash
docker-compose down
```  
✔ Fazer backup da imagem Docker (`docker save`)  
✔ Fazer backup dos volumes (`cp` ou `tar`)  
✔ Fazer backup dos arquivos extras (`tar -czvf backup_n8n_files.tar.gz /home/ubuntu/n8n`)  