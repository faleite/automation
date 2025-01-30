## VM Created=22/01/2025

### Acesso a instância VPS
`ssh -i ./ssh-key-2025-01-21.key ubuntu@130.61.72.50`

### meu IP
`109.48.245.113`

### Comandos do Docker
- verificar versão do n8n local: `docker exec -it n8n-n8n-1 n8n -v`
- [consultar versao do n8n remoto](https://hub.docker.com/r/n8nio/n8n/tags)

### Configuração do Servidor
```.env
OCID=ocid1.instance.oc1.eu-frankfurt-1.antheljrawoymnycruhcbzstshf4xuokzlrksneg3ldteeva2x4zogryadha
IP=130.61.72.50
Username=ubuntu
```

### Configuração do Firewall
```bash
sudo iptables -F && 
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT &&
sudo iptables -A INPUT -i lo -j ACCEPT &&
sudo iptables -A OUTPUT -o lo -j ACCEPT &&
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT &&
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT &&
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT &&
sudo iptables -P INPUT DROP &&
sudo service netfilter-persistent save &&
sudo service netfilter-persistent reload
```

### Configuração do n8n
Nesse caso, já que você está utilizando o certificado SSL do Cloudflare (ou talvez não precise dele),\
basta comentar as linhas relacionadas à geração e utilização do certificado no seu arquivo docker-compose.yaml.

No serviço traefik, as linhas a comentar com #, são essas:
      - "--certificatesresolvers.mytlschallenge.acme.tlschallenge=true"
      - "--certificatesresolvers.mytlschallenge.acme.email=${SSL_EMAIL}"
      - "--certificatesresolvers.mytlschallenge.acme.storage=/letsencrypt/acme.json"

 - traefik_data:/letsencrypt

Já no serviço do N8N, essa:
      - traefik.http.routers.n8n.tls.certresolver=mytlschallenge