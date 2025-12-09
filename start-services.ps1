Write-Host "========================================" -ForegroundColor Cyan
Write-Host "RevCart Microservices Startup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check Docker
Write-Host "[1/3] Checking Docker..." -ForegroundColor Yellow
$dockerRunning = docker ps 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Docker is not running! Please start Docker Desktop." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}
Write-Host "[OK] Docker is running" -ForegroundColor Green
Write-Host ""

# Start Consul
Write-Host "[2/3] Starting Consul..." -ForegroundColor Yellow
Set-Location "infrastructure\consul"
docker-compose up -d
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Failed to start Consul" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}
Write-Host "[OK] Consul started on http://localhost:8500" -ForegroundColor Green
Set-Location "..\.."
Write-Host ""

Write-Host "Waiting 10 seconds for Consul..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Start Config Server
Write-Host "[3/3] Starting Config Server..." -ForegroundColor Yellow
Set-Location "infrastructure\config-server"
Start-Process powershell -ArgumentList "-NoExit", "-Command", "Write-Host 'Config Server - Port 8888' -ForegroundColor Cyan; mvn spring-boot:run"
Set-Location "..\.."
Write-Host "[OK] Config Server starting on port 8888" -ForegroundColor Green
Write-Host ""

Write-Host "Waiting 40 seconds for Config Server..." -ForegroundColor Yellow
Start-Sleep -Seconds 40

# Start API Gateway
Write-Host "Starting API Gateway..." -ForegroundColor Yellow
Set-Location "backend-services\api-gateway"
Start-Process powershell -ArgumentList "-NoExit", "-Command", "Write-Host 'API Gateway - Port 8080' -ForegroundColor Cyan; mvn spring-boot:run"
Set-Location "..\.."
Write-Host "[OK] API Gateway starting on port 8080" -ForegroundColor Green
Write-Host ""

Write-Host "Waiting 30 seconds for API Gateway..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

# Start all microservices
Write-Host "Starting all microservices..." -ForegroundColor Yellow
Write-Host ""

$services = @(
    @{Name="User Service"; Port=8081; Path="backend-services\user-service"},
    @{Name="Product Service"; Port=8082; Path="backend-services\product-service"},
    @{Name="Cart Service"; Port=8083; Path="backend-services\cart-service"},
    @{Name="Order Service"; Port=8084; Path="backend-services\order-service"},
    @{Name="Payment Service"; Port=8085; Path="backend-services\payment-service"},
    @{Name="Delivery Service"; Port=8086; Path="backend-services\delivery-service"},
    @{Name="Notification Service"; Port=8087; Path="backend-services\notification-service"},
    @{Name="Analytics Service"; Port=8088; Path="backend-services\analytics-service"}
)

foreach ($service in $services) {
    Set-Location $service.Path
    $title = "$($service.Name) - Port $($service.Port)"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "Write-Host '$title' -ForegroundColor Cyan; mvn spring-boot:run"
    Set-Location "..\.."
    Write-Host "[OK] $($service.Name) starting on port $($service.Port)" -ForegroundColor Green
    Start-Sleep -Seconds 2
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "All services are starting!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Access Points:" -ForegroundColor Yellow
Write-Host "- Consul UI:      http://localhost:8500" -ForegroundColor White
Write-Host "- Config Server:  http://localhost:8888" -ForegroundColor White
Write-Host "- API Gateway:    http://localhost:8080" -ForegroundColor White
Write-Host ""
Write-Host "Wait 2-3 minutes for all services to register with Consul" -ForegroundColor Yellow
Write-Host "Then check Consul UI to verify all services are registered" -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to continue"
