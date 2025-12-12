@echo off
color 0A
echo ========================================
echo RevCart - Starting Locally (All Services)
echo ========================================
echo.

echo REQUIREMENTS:
echo - MySQL running on port 3306
echo - MongoDB running on port 27017
echo - Redis running on port 6379
echo.
pause

echo [1/5] Building all services...
call mvn clean install -DskipTests
if %errorlevel% neq 0 (
    echo [ERROR] Build failed!
    pause
    exit /b 1
)

echo [2/5] Starting Backend Services...
start "User Service" cmd /k "cd backend-services\user-service && mvn spring-boot:run"
timeout /t 20
start "Product Service" cmd /k "cd backend-services\product-service && mvn spring-boot:run"
timeout /t 20
start "Cart Service" cmd /k "cd backend-services\cart-service && mvn spring-boot:run"
timeout /t 20
start "Order Service" cmd /k "cd backend-services\order-service && mvn spring-boot:run"
timeout /t 20
start "Payment Service" cmd /k "cd backend-services\payment-service && mvn spring-boot:run"
timeout /t 20
start "Delivery Service" cmd /k "cd backend-services\delivery-service && mvn spring-boot:run"
timeout /t 20
start "Notification Service" cmd /k "cd backend-services\notification-service && mvn spring-boot:run"
timeout /t 20
start "Analytics Service" cmd /k "cd backend-services\analytics-service && mvn spring-boot:run"
timeout /t 20
start "API Gateway" cmd /k "cd backend-services\api-gateway && mvn spring-boot:run"
timeout /t 25

echo [3/5] Installing Frontend Dependencies...
cd frontend-services\shell-app
if not exist "node_modules" (
    echo Installing npm packages...
    call npm install
)
cd ..\..

echo [4/5] Starting Frontend...
start "RevCart Frontend" cmd /k "cd frontend-services\shell-app && npm start"

echo.
echo ========================================
echo ALL SERVICES STARTING!
echo ========================================
echo.
echo Wait 3-4 minutes, then open:
echo http://localhost:4200
echo.
echo API Gateway: http://localhost:8090
echo Test API: http://localhost:8090/api/products
echo.
pause