$ErrorActionPreference = "Stop"
$env:AWS_DEFAULT_REGION = "us-east-1"

Write-Host "Creating ECR Repositories..."
try { aws ecr create-repository --repository-name back-ventas | Out-Null } catch {}
try { aws ecr create-repository --repository-name back-despachos | Out-Null } catch {}
try { aws ecr create-repository --repository-name front-despacho | Out-Null } catch {}

Write-Host "Logging into ECR..."
$password = aws ecr get-login-password --region us-east-1
$password | docker login --username AWS --password-stdin 686062068924.dkr.ecr.us-east-1.amazonaws.com

Write-Host "Building and pushing Ventas Backend..."
docker build -t back-ventas ./back-Ventas_SpringBoot/Springboot-API-REST
docker tag back-ventas:latest 686062068924.dkr.ecr.us-east-1.amazonaws.com/back-ventas:latest
docker push 686062068924.dkr.ecr.us-east-1.amazonaws.com/back-ventas:latest

Write-Host "Building and pushing Despachos Backend..."
docker build -t back-despachos ./back-Despachos_SpringBoot/Springboot-API-REST-DESPACHO
docker tag back-despachos:latest 686062068924.dkr.ecr.us-east-1.amazonaws.com/back-despachos:latest
docker push 686062068924.dkr.ecr.us-east-1.amazonaws.com/back-despachos:latest

Write-Host "Building and pushing Frontend..."
docker build --build-arg NGINX_CONF=nginx.prod.conf -t front-despacho ./front_despacho
docker tag front-despacho:latest 686062068924.dkr.ecr.us-east-1.amazonaws.com/front-despacho:latest
docker push 686062068924.dkr.ecr.us-east-1.amazonaws.com/front-despacho:latest

Write-Host "Images successfully built and pushed to ECR!"
