$ErrorActionPreference = "Stop"
$env:AWS_DEFAULT_REGION = "us-east-1"

$resources = Get-Content "aws-resources.json" | ConvertFrom-Json

Write-Host "Creating DB Subnet Group..."
aws rds create-db-subnet-group `
    --db-subnet-group-name ecommerce-db-subnet-group `
    --db-subnet-group-description "Ecommerce DB Subnet Group" `
    --subnet-ids $resources.PrivateSubnet1 $resources.PrivateSubnet2 | Out-Null

Write-Host "Creating RDS MySQL Instance (this takes 5-10 minutes)..."
aws rds create-db-instance `
    --db-instance-identifier ecommerce-db `
    --db-instance-class db.t3.micro `
    --engine mysql `
    --master-username dbuser `
    --master-user-password dbpassword `
    --allocated-storage 20 `
    --db-subnet-group-name ecommerce-db-subnet-group `
    --vpc-security-group-ids $resources.RdsSgId `
    --no-publicly-accessible `
    --db-name ventas_db | Out-Null

Write-Host "Waiting for RDS Instance to become available..."
aws rds wait db-instance-available --db-instance-identifier ecommerce-db

$dbEndpoint = (aws rds describe-db-instances --db-instance-identifier ecommerce-db --query 'DBInstances[0].Endpoint.Address' --output text)
Write-Host "RDS Instance available at: $dbEndpoint"

$resources | Add-Member -MemberType NoteProperty -Name "DbEndpoint" -Value $dbEndpoint
$resources | ConvertTo-Json | Out-File "aws-resources.json"
Write-Host "RDS setup completed successfully."
