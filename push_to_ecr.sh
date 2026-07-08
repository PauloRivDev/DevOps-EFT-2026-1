#!/bin/bash
set -e

# Log in to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 058061547253.dkr.ecr.us-east-1.amazonaws.com

# 1. Build and push Ventas
echo "Building Ventas Backend..."
docker build -t back-ventas ./back-Ventas_SpringBoot/Springboot-API-REST
docker tag back-ventas:latest 058061547253.dkr.ecr.us-east-1.amazonaws.com/back-ventas:latest
docker push 058061547253.dkr.ecr.us-east-1.amazonaws.com/back-ventas:latest

# 2. Build and push Despachos
echo "Building Despachos Backend..."
docker build -t back-despachos ./back-Despachos_SpringBoot/Springboot-API-REST-DESPACHO
docker tag back-despachos:latest 058061547253.dkr.ecr.us-east-1.amazonaws.com/back-despachos:latest
docker push 058061547253.dkr.ecr.us-east-1.amazonaws.com/back-despachos:latest

# 3. Build and push Frontend
echo "Building Frontend..."
docker build --build-arg NGINX_CONF=nginx.prod.conf -t front-despacho ./front_despacho
docker tag front-despacho:latest 058061547253.dkr.ecr.us-east-1.amazonaws.com/front-despacho:latest
docker push 058061547253.dkr.ecr.us-east-1.amazonaws.com/front-despacho:latest

echo "Images successfully pushed to ECR!"
