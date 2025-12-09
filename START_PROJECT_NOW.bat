@echo off
color 0A
echo ========================================
echo RevCart - Complete Project Startup
echo ========================================
echo.

REM Step 1: Check if Docker is running
echo [STEP 1] Checking Docker...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker is not installed or not running!
    echo Please install Docker Desktop and start it.
    pause
    exit /b 1
)
echo [OK] Docker is running
echo.

REM Step 2: Start Consul
echo [STEP 2] Starting Consul (Service Discovery)...
cd infrastructure\consul
docker-compose down >nul 2>&1
docker-compose up -d
cd ..\..
timeout /t 10
echo [OK] Consul started on http://localhost:8500
echo.

REM Step 3: Start Databases
echo [STEP 3] Starting Databases (MySQL, MongoDB, Redis)...
docker-compose up -d mysql-users mysql-products mysql-orders mysql-payments mysql-delivery mongodb redis
timeout /t 20
echo [OK] Databases started
echo.

REM Step 4: Build all backend services
echo [STEP 4] Building all backend services...
echo This may take 2-3 minutes...
call mvn clean install -DskipTests
if %errorlevel% neq 0 (
    echo [ERROR] Build failed! Check the error messages above.
    pause
    exit /b 1
)
echo [OK] All services built successfully
echo.

REM Step 5: Start Backend Services
echo [STEP 5] Starting Backend Services...
echo.

echo Starting User Service (Port 8081)...
start "User Service" cmd /k "cd backend-services\user-service && mvn spring-boot:run"
timeout /t 15

echo Starting Product Service (Port 8082)...
start "Product Service" cmd /k "cd backend-services\product-service && mvn spring-boot:run"
timeout /t 15

echo Starting Cart Service (Port 8083)...
start "Cart Service" cmd /k "cd backend-services\cart-service && mvn spring-boot:run"
timeout /t 15

echo Starting Order Service (Port 8084)...
start "Order Service" cmd /k "cd backend-services\order-service && mvn spring-boot:run"
timeout /t 15

echo Starting Payment Service (Port 8085)...
start "Payment Service" cmd /k "cd backend-services\payment-service && mvn spring-boot:run"
timeout /t 15

echo Starting Delivery Service (Port 8086)...
start "Delivery Service" cmd /k "cd backend-services\delivery-service && mvn spring-boot:run"
timeout /t 15

echo Starting Notification Service (Port 8087)...
start "Notification Service" cmd /k "cd backend-services\notification-service && mvn spring-boot:run"
timeout /t 15

echo Starting Analytics Service (Port 8088)...
start "Analytics Service" cmd /k "cd backend-services\analytics-service && mvn spring-boot:run"
timeout /t 15

echo Starting API Gateway (Port 8090)...
start "API Gateway" cmd /k "cd backend-services\api-gateway && mvn spring-boot:run"
timeout /t 20

echo [OK] All backend services are starting...
echo.

REM Step 6: Install Frontend Dependencies
echo [STEP 6] Installing Frontend Dependencies...
cd frontend-services\shell-app
if not exist "node_modules" (
    echo Installing npm packages...
    call npm install
)
cd ..\..
echo [OK] Frontend dependencies ready
echo.

REM Step 7: Start Frontend
echo [STEP 7] Starting Frontend Application...
start "RevCart Frontend" cmd /k "cd frontend-services\shell-app && npm start"
echo.

echo ========================================
echo ALL SERVICES STARTED!
echo ========================================
echo.
echo Please wait 2-3 minutes for all services to fully start
echo.
echo ACCESS POINTS:
echo ========================================
echo Frontend UI:       http://localhost:4200
echo API Gateway:       http://localhost:8090
echo Consul Dashboard:  http://localhost:8500
echo.
echo BACKEND SERVICES:
echo User Service:      http://localhost:8081
echo Product Service:   http://localhost:8082
echo Cart Service:      http://localhost:8083
echo Order Service:     http://localhost:8084
echo Payment Service:   http://localhost:8085
echo Delivery Service:  http://localhost:8086
echo Notification:      http://localhost:8087
echo Analytics:         http://localhost:8088
echo.
echo TEST API:
echo http://localhost:8090/api/products
echo.
echo ========================================
echo.
pause
