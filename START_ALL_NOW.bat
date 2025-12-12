@echo off
color 0A
echo ========================================
echo RevCart - Starting All Services
echo ========================================
echo.

REM Check Docker
docker ps >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker not running! Starting Docker Desktop...
    start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    echo Waiting 60 seconds for Docker to start...
    timeout /t 60
)

echo [1/6] Starting Consul (Service Discovery)...
cd infrastructure\consul
docker-compose up -d
cd ..\..
timeout /t 10

echo [2/6] Starting Databases...
docker-compose up -d mysql-users mysql-products mysql-orders mysql-payments mysql-delivery mongodb redis
timeout /t 20

echo [3/6] Building all services...
call mvn clean install -DskipTests
if %errorlevel% neq 0 (
    echo [ERROR] Build failed!
    pause
    exit /b 1
)

echo [4/6] Starting Backend Services...
start "User Service" cmd /k "cd backend-services\user-service && mvn spring-boot:run"
timeout /t 15
start "Product Service" cmd /k "cd backend-services\product-service && mvn spring-boot:run"
timeout /t 15
start "Cart Service" cmd /k "cd backend-services\cart-service && mvn spring-boot:run"
timeout /t 15
start "Order Service" cmd /k "cd backend-services\order-service && mvn spring-boot:run"
timeout /t 15
start "Payment Service" cmd /k "cd backend-services\payment-service && mvn spring-boot:run"
timeout /t 15
start "Delivery Service" cmd /k "cd backend-services\delivery-service && mvn spring-boot:run"
timeout /t 15
start "Notification Service" cmd /k "cd backend-services\notification-service && mvn spring-boot:run"
timeout /t 15
start "Analytics Service" cmd /k "cd backend-services\analytics-service && mvn spring-boot:run"
timeout /t 15
start "API Gateway" cmd /k "cd backend-services\api-gateway && mvn spring-boot:run"
timeout /t 20

echo [5/6] Installing Frontend Dependencies...
cd frontend-services\shell-app
if not exist "node_modules" (
    echo Installing npm packages...
    call npm install
)
cd ..\..

echo [6/6] Starting Frontend...
start "RevCart Frontend" cmd /k "cd frontend-services\shell-app && npm start"

echo.
echo ========================================
echo ALL SERVICES STARTED!
echo ========================================
echo.
echo Wait 3-4 minutes for all services to fully start
echo.
echo ACCESS POINTS:
echo Frontend:     http://localhost:4200
echo API Gateway:  http://localhost:8090
echo Consul:       http://localhost:8500
echo.
echo TEST API:
echo http://localhost:8090/api/products
echo.
pause