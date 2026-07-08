$ErrorActionPreference = "Stop"
$env:AWS_DEFAULT_REGION = "us-east-1"
$resources = Get-Content "aws-resources.json" | ConvertFrom-Json

$frontTgArn = (aws elbv2 describe-target-groups --names front-tg --query 'TargetGroups[0].TargetGroupArn' --output text)
$ventasTgArn = (aws elbv2 describe-target-groups --names ventas-tg --query 'TargetGroups[0].TargetGroupArn' --output text)
$despachosTgArn = (aws elbv2 describe-target-groups --names despachos-tg --query 'TargetGroups[0].TargetGroupArn' --output text)

Write-Host "Creating ECS Service..."
aws ecs create-service `
    --cluster ecommerce-cluster `
    --service-name ecommerce-service `
    --task-definition ecommerce-task `
    --desired-count 2 `
    --launch-type FARGATE `
    --network-configuration "awsvpcConfiguration={subnets=[$($resources.PrivateSubnet1),$($resources.PrivateSubnet2)],securityGroups=[$($resources.EcsSgId)],assignPublicIp=DISABLED}" `
    --load-balancers "targetGroupArn=$frontTgArn,containerName=front-despacho,containerPort=80" "targetGroupArn=$ventasTgArn,containerName=back-ventas,containerPort=8080" "targetGroupArn=$despachosTgArn,containerName=back-despachos,containerPort=8081"

Write-Host "Configuring Auto Scaling..."
aws application-autoscaling register-scalable-target `
    --service-namespace ecs `
    --scalable-dimension ecs:service:DesiredCount `
    --resource-id service/ecommerce-cluster/ecommerce-service `
    --min-capacity 2 `
    --max-capacity 4

aws application-autoscaling put-scaling-policy `
    --service-namespace ecs `
    --scalable-dimension ecs:service:DesiredCount `
    --resource-id service/ecommerce-cluster/ecommerce-service `
    --policy-name cpu-tracking-policy `
    --policy-type TargetTrackingScaling `
    --target-tracking-scaling-policy-configuration file://autoscaling-policy.json
