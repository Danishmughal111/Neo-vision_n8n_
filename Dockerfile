# Base image - Node.js environment (n8n ke liye required)
FROM node:18-alpine

# System update aur dependencies install karo
RUN apk update && apk add --no-cache \
    python3 \
    make \
    g++ \
    git \
    && rm -rf /var/cache/apk/*

# n8n globally install karo (ye line IMPORTANT hai)
RUN npm install -g n8n@latest

# Working directory set karo
WORKDIR /app

# n8n configuration directory banayo
RUN mkdir -p /home/node/.n8n

# Environment variables set karo
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=neo123vision
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV WEBHOOK_URL=https://neo-vision-n8n.onrender.com
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Port expose karo (n8n 5678 port use karta hai)
EXPOSE 5678

# n8n start karne ka command (ye line IMPORTANT hai)
CMD ["n8n", "start"]
