@echo off
echo ========================================
echo RevCart Microservices Startup Script
echo ========================================
echo.

REM Check if Docker is running
docker ps >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker Desktop is not running!
    echo Please start Docker Desktop first.
    echo.
    pause
    exit /b 1
)

echo [1/3] Starting Consul...
cd infrastructure\consul
docker-compose up -d
if %errorlevel% neq 0 (
    echo [ERROR] Failed to start Consul
    pause
    exit /b 1
)
echo [OK] Consul started on http://localhost:8500
echo.

echo Waiting 10 seconds for Consul to be ready...
timeout /t 10 /nobreak >nul

echo [2/3] Starting Config Server...
cd ..\..\infrastructure\config-server
start "Config-Server-8888" cmd /k "mvn spring-boot:run"
echo [OK] Config Server starting on port 8888
echo.

echo Waiting 30 seconds for Config Server to be ready...
timeout /t 30 /nobreak >nul

echo [3/3] Starting API Gateway...
cd ..\..\backend-services\api-gateway
start "API-Gateway-8080" cmd /k "mvn spring-boot:run"
echo [OK] API Gateway starting on port 8080
echo.

echo Waiting 20 seconds for API Gateway to be ready...
timeout /t 20 /nobreak >nul

echo Starting all microservices...
echo.

cd ..\user-service
start "User-Service-8081" cmd /k "mvn spring-boot:run"
echo [OK] User Service starting on port 8081

cd ..\product-service
start "Product-Service-8082" cmd /k "mvn spring-boot:run"
echo [OK] Product Service starting on port 8082

cd ..\cart-service
start "Cart-Service-8083" cmd /k "mvn spring-boot:run"
echo [OK] Cart Service starting on port 8083

cd ..\order-service
start "Order-Service-8084" cmd /k "mvn spring-boot:run"
echo [OK] Order Service starting on port 8084

cd ..\payment-service
start "Payment-Service-8085" cmd /k "mvn spring-boot:run"
echo [OK] Payment Service starting on port 8085

cd ..\delivery-service
start "Delivery-Service-8086" cmd /k "mvn spring-boot:run"
echo [OK] Delivery Service starting on port 8086

cd ..\notification-service
start "Notification-Service-8087" cmd /k "mvn spring-boot:run"
echo [OK] Notification Service starting on port 8087

cd ..\analytics-service
start "Analytics-Service-8088" cmd /k "mvn spring-boot:run"
echo [OK] Analytics Service starting on port 8088

cd ..\..

echo.
echo ========================================
echo All services are starting!
echo ========================================
echo.
echo Access Points:
echo - Consul UI:      http://localhost:8500
echo - Config Server:  http://localhost:8888
echo - API Gateway:    http://localhost:8080
echo.
echo Wait 2-3 minutes for all services to register with Consul
echo Then check Consul UI to verify all services are registered
echo.
pause
