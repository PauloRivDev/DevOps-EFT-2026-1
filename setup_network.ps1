$ErrorActionPreference = "Stop"
$env:AWS_DEFAULT_REGION = "us-east-1"

Write-Host "Creating VPC..."
$vpcId = (aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query Vpc.VpcId --output text)
aws ec2 create-tags --resources $vpcId --tags Key=Name,Value=ecommerce-vpc
aws ec2 modify-vpc-attribute --vpc-id $vpcId --enable-dns-hostnames "{\`"Value\`":true}"
aws ec2 modify-vpc-attribute --vpc-id $vpcId --enable-dns-support "{\`"Value\`":true}"
Write-Host "VPC created: $vpcId"

Write-Host "Creating Subnets..."
$pubSub1 = (aws ec2 create-subnet --vpc-id $vpcId --cidr-block 10.0.1.0/24 --availability-zone us-east-1a --query Subnet.SubnetId --output text)
aws ec2 create-tags --resources $pubSub1 --tags Key=Name,Value=ecommerce-pub-1a
aws ec2 modify-subnet-attribute --subnet-id $pubSub1 --map-public-ip-on-launch

$pubSub2 = (aws ec2 create-subnet --vpc-id $vpcId --cidr-block 10.0.2.0/24 --availability-zone us-east-1b --query Subnet.SubnetId --output text)
aws ec2 create-tags --resources $pubSub2 --tags Key=Name,Value=ecommerce-pub-1b
aws ec2 modify-subnet-attribute --subnet-id $pubSub2 --map-public-ip-on-launch

$privSub1 = (aws ec2 create-subnet --vpc-id $vpcId --cidr-block 10.0.3.0/24 --availability-zone us-east-1a --query Subnet.SubnetId --output text)
aws ec2 create-tags --resources $privSub1 --tags Key=Name,Value=ecommerce-priv-1a

$privSub2 = (aws ec2 create-subnet --vpc-id $vpcId --cidr-block 10.0.4.0/24 --availability-zone us-east-1b --query Subnet.SubnetId --output text)
aws ec2 create-tags --resources $privSub2 --tags Key=Name,Value=ecommerce-priv-1b
Write-Host "Subnets created."

Write-Host "Creating Internet Gateway..."
$igwId = (aws ec2 create-internet-gateway --query InternetGateway.InternetGatewayId --output text)
aws ec2 attach-internet-gateway --vpc-id $vpcId --internet-gateway-id $igwId
aws ec2 create-tags --resources $igwId --tags Key=Name,Value=ecommerce-igw

Write-Host "Creating Public Route Table..."
$pubRtId = (aws ec2 create-route-table --vpc-id $vpcId --query RouteTable.RouteTableId --output text)
aws ec2 create-tags --resources $pubRtId --tags Key=Name,Value=ecommerce-pub-rt
aws ec2 create-route --route-table-id $pubRtId --destination-cidr-block 0.0.0.0/0 --gateway-id $igwId | Out-Null
aws ec2 associate-route-table --subnet-id $pubSub1 --route-table-id $pubRtId | Out-Null
aws ec2 associate-route-table --subnet-id $pubSub2 --route-table-id $pubRtId | Out-Null

Write-Host "Creating NAT Gateway (this may take a few minutes)..."
$eipAllocationId = (aws ec2 allocate-address --domain vpc --query AllocationId --output text)
$natGwId = (aws ec2 create-nat-gateway --subnet-id $pubSub1 --allocation-id $eipAllocationId --query NatGateway.NatGatewayId --output text)
aws ec2 create-tags --resources $natGwId --tags Key=Name,Value=ecommerce-nat

Write-Host "Waiting for NAT Gateway to become available..."
aws ec2 wait nat-gateway-available --nat-gateway-ids $natGwId

Write-Host "Creating Private Route Table..."
$privRtId = (aws ec2 create-route-table --vpc-id $vpcId --query RouteTable.RouteTableId --output text)
aws ec2 create-tags --resources $privRtId --tags Key=Name,Value=ecommerce-priv-rt
aws ec2 create-route --route-table-id $privRtId --destination-cidr-block 0.0.0.0/0 --nat-gateway-id $natGwId | Out-Null
aws ec2 associate-route-table --subnet-id $privSub1 --route-table-id $privRtId | Out-Null
aws ec2 associate-route-table --subnet-id $privSub2 --route-table-id $privRtId | Out-Null

Write-Host "Creating Security Groups..."
$albSgId = (aws ec2 create-security-group --group-name alb-sg --description "ALB Security Group" --vpc-id $vpcId --query GroupId --output text)
aws ec2 authorize-security-group-ingress --group-id $albSgId --protocol tcp --port 80 --cidr 0.0.0.0/0 | Out-Null
aws ec2 authorize-security-group-ingress --group-id $albSgId --protocol tcp --port 443 --cidr 0.0.0.0/0 | Out-Null
aws ec2 create-tags --resources $albSgId --tags Key=Name,Value=alb-sg

$ecsSgId = (aws ec2 create-security-group --group-name ecs-sg --description "ECS Security Group" --vpc-id $vpcId --query GroupId --output text)
aws ec2 authorize-security-group-ingress --group-id $ecsSgId --protocol tcp --port 80 --source-group $albSgId | Out-Null
aws ec2 authorize-security-group-ingress --group-id $ecsSgId --protocol tcp --port 8080 --source-group $albSgId | Out-Null
aws ec2 authorize-security-group-ingress --group-id $ecsSgId --protocol tcp --port 8081 --source-group $albSgId | Out-Null
aws ec2 create-tags --resources $ecsSgId --tags Key=Name,Value=ecs-sg

$rdsSgId = (aws ec2 create-security-group --group-name rds-sg --description "RDS Security Group" --vpc-id $vpcId --query GroupId --output text)
aws ec2 authorize-security-group-ingress --group-id $rdsSgId --protocol tcp --port 3306 --source-group $ecsSgId | Out-Null
aws ec2 create-tags --resources $rdsSgId --tags Key=Name,Value=rds-sg

$output = @{
    VpcId = $vpcId
    PublicSubnet1 = $pubSub1
    PublicSubnet2 = $pubSub2
    PrivateSubnet1 = $privSub1
    PrivateSubnet2 = $privSub2
    AlbSgId = $albSgId
    EcsSgId = $ecsSgId
    RdsSgId = $rdsSgId
}
$output | ConvertTo-Json | Out-File "aws-resources.json"
Write-Host "Network and Security setup completed successfully."
