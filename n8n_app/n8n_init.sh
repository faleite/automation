#!/bin/bash

# Create the volume if it doesn't exist
docker volume inspect n8n_data > /dev/null 2>&1 || docker volume create n8n_data

docker run -it --rm \
--name n8n \
-p 5678:5678 \
-e GENERIC_TIMEZONE="Europe/Lisbon" \
-e TZ="Europe/Lisbon" \
-v n8n_data:/home/node/.n8n \
docker.n8n.io/n8nio/n8n
