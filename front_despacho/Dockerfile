# Etapa 1: Compilación de la aplicación (Builder)
FROM node:20-alpine AS builder

WORKDIR /app

# Copiar archivos de dependencias para caching eficiente
COPY package*.json ./
RUN npm ci

# Copiar el código fuente y construir los archivos estáticos
COPY . .
RUN npm run build

# Etapa 2: Servidor web de producción (Nginx minimalista)
FROM nginx:1.25-alpine

# Copiar los recursos compilados de la etapa anterior
COPY --from=builder /app/dist /usr/share/nginx/html

# Copiar la configuración personalizada de Nginx
ARG NGINX_CONF=nginx.conf
COPY ${NGINX_CONF} /etc/nginx/conf.d/default.conf

# Exponer el puerto estándar
EXPOSE 80

# Iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
