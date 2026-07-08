$ErrorActionPreference = "Stop"

# Obtener el ALB de los recursos
$resources = Get-Content "aws-resources.json" | ConvertFrom-Json
$albUrl = "http://$($resources.AlbDns)"
Write-Host "ALB URL: $albUrl"

Write-Host "`n--- 1. Probando crear una Venta (Backend Ventas) ---"
$ventaPayload = @{
    direccionCompra = "Av. Providencia 1234, Santiago"
    valorCompra = 45000
    fechaCompra = "2026-07-08"
    despachoGenerado = $false
} | ConvertTo-Json

try {
    $ventaResponse = Invoke-RestMethod -Uri "$albUrl/api/v1/ventas" -Method Post -Body $ventaPayload -ContentType "application/json"
    Write-Host "¡Venta creada exitosamente!"
    Write-Host ($ventaResponse | Format-List | Out-String)
    
    $idVenta = $ventaResponse.idVenta
} catch {
    Write-Host "Error al crear la venta: $_"
    $idVenta = 1
}

Write-Host "`n--- 2. Probando crear un Despacho (Backend Despachos) ---"
$despachoPayload = @{
    fechaDespacho = "2026-07-09"
    patenteCamion = "AB-CD-12"
    intento = 1
    idCompra = $idVenta
    direccionCompra = "Av. Providencia 1234, Santiago"
    valorCompra = 45000
    despachado = $false
} | ConvertTo-Json

try {
    $despachoResponse = Invoke-RestMethod -Uri "$albUrl/api/v1/despachos" -Method Post -Body $despachoPayload -ContentType "application/json"
    Write-Host "¡Despacho creado exitosamente!"
    Write-Host ($despachoResponse | Format-List | Out-String)
} catch {
    Write-Host "Error al crear el despacho: $_"
}

Write-Host "`n--- 3. Probando Frontend (Root URL) ---"
try {
    $frontResponse = Invoke-WebRequest -Uri "$albUrl/" -UseBasicParsing
    Write-Host "¡Frontend responde exitosamente con Status Code $($frontResponse.StatusCode)!"
} catch {
    Write-Host "Error conectando al Frontend: $_"
}

Write-Host "`n¡Pruebas finalizadas!"
