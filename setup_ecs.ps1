$ErrorActionPreference = "Stop"
$env:AWS_DEFAULT_REGION = "us-east-1"

$resources = Get-Content "aws-resources.json" | ConvertFrom-Json

Write-Host "Creating Application Load Balancer..."
$albArn = (aws elbv2 create-load-balancer `
    --name ecommerce-alb `
    --subnets $resources.PublicSubnet1 $resources.PublicSubnet2 `
    --security-groups $resources.AlbSgId `
    --query 'LoadBalancers[0].LoadBalancerArn' `
    --output text)

Write-Host "Creating Target Groups..."
$frontTgArn = (aws elbv2 create-target-group --name front-tg --protocol HTTP --port 80 --vpc-id $resources.VpcId --target-type ip --query 'TargetGroups[0].TargetGroupArn' --output text)
$ventasTgArn = (aws elbv2 create-target-group --name ventas-tg --protocol HTTP --port 8080 --vpc-id $resources.VpcId --target-type ip --query 'TargetGroups[0].TargetGroupArn' --output text)
$despachosTgArn = (aws elbv2 create-target-group --name despachos-tg --protocol HTTP --port 8081 --vpc-id $resources.VpcId --target-type ip --query 'TargetGroups[0].TargetGroupArn' --output text)

aws elbv2 modify-target-group-attributes --target-group-arn $frontTgArn --attributes Key=deregistration_delay.timeout_seconds,Value=30 | Out-Null
aws elbv2 modify-target-group-attributes --target-group-arn $ventasTgArn --attributes Key=deregistration_delay.timeout_seconds,Value=30 | Out-Null
aws elbv2 modify-target-group-attributes --target-group-arn $despachosTgArn --attributes Key=deregistration_delay.timeout_seconds,Value=30 | Out-Null

Write-Host "Creating ALB Listener..."
$listenerArn = (aws elbv2 create-listener `
    --load-balancer-arn $albArn `
    --protocol HTTP `
    --port 80 `
    --default-actions Type=forward,TargetGroupArn=$frontTgArn `
    --query 'Listeners[0].ListenerArn' `
    --output text)

Write-Host "Creating Listener Rules..."
aws elbv2 create-rule `
    --listener-arn $listenerArn `
    --conditions Field=path-pattern,Values='/api/v1/ventas*' `
    --priority 10 `
    --actions Type=forward,TargetGroupArn=$ventasTgArn | Out-Null

aws elbv2 create-rule `
    --listener-arn $listenerArn `
    --conditions Field=path-pattern,Values='/api/v1/despachos*' `
    --priority 20 `
    --actions Type=forward,TargetGroupArn=$despachosTgArn | Out-Null

Write-Host "Creating ECS Cluster..."
try { aws ecs create-cluster --cluster-name ecommerce-cluster | Out-Null } catch {}

Write-Host "Creating CloudWatch Log Group..."
try { aws logs create-log-group --log-group-name ecs/ecommerce-task | Out-Null } catch {}

Write-Host "Registering ECS Task Definition..."
aws ecs register-task-definition --cli-input-json file://ecs-task-def.json | Out-Null

Write-Host "Creating ECS Service..."
aws ecs create-service `
    --cluster ecommerce-cluster `
    --service-name ecommerce-service `
    --task-definition ecommerce-task `
    --desired-count 1 `
    --launch-type FARGATE `
    --network-configuration "awsvpcConfiguration={subnets=[$($resources.PrivateSubnet1),$($resources.PrivateSubnet2)],securityGroups=[$($resources.EcsSgId)],assignPublicIp=DISABLED}" `
    --load-balancers "targetGroupArn=$frontTgArn,containerName=front-despacho,containerPort=80" "targetGroupArn=$ventasTgArn,containerName=back-ventas,containerPort=8080" "targetGroupArn=$despachosTgArn,containerName=back-despachos,containerPort=8081" | Out-Null

Write-Host "Configuring Auto Scaling..."
aws application-autoscaling register-scalable-target `
    --service-namespace ecs `
    --scalable-dimension ecs:service:DesiredCount `
    --resource-id service/ecommerce-cluster/ecommerce-service `
    --min-capacity 1 `
    --max-capacity 3 | Out-Null

aws application-autoscaling put-scaling-policy `
    --service-namespace ecs `
    --scalable-dimension ecs:service:DesiredCount `
    --resource-id service/ecommerce-cluster/ecommerce-service `
    --policy-name cpu-tracking-policy `
    --policy-type TargetTrackingScaling `
    --target-tracking-scaling-policy-configuration file://autoscaling-policy.json | Out-Null

$albDns = (aws elbv2 describe-load-balancers --load-balancer-arns $albArn --query 'LoadBalancers[0].DNSName' --output text)
Write-Host "ECS Setup completed successfully!"
Write-Host "ALB DNS Name: $albDns"
$resources | Add-Member -MemberType NoteProperty -Name "AlbDns" -Value $albDns
$resources | ConvertTo-Json | Out-File "aws-resources.json"
