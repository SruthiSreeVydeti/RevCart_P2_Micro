@echo off
color 0A
echo ========================================
echo Starting RevCart WITHOUT Docker
echo (Using local MySQL/MongoDB/Redis)
echo ========================================
echo.

echo IMPORTANT: Make sure you have running locally:
echo - MySQL on port 3307
echo - MongoDB on port 27017
echo - Redis on port 6379
echo.
echo Press Ctrl+C to cancel, or
pause

echo.
echo [1/4] Starting Backend Services...
echo.

echo Starting Product Service (8082)...
start "Product Service" cmd /k "cd backend-services\product-service && mvn spring-boot:run"
timeout /t 20

echo Starting User Service (8081)...
start "User Service" cmd /k "cd backend-services\user-service && mvn spring-boot:run"
timeout /t 20

echo Starting Cart Service (8083)...
start "Cart Service" cmd /k "cd backend-services\cart-service && mvn spring-boot:run"
timeout /t 20

echo Starting Order Service (8084)...
start "Order Service" cmd /k "cd backend-services\order-service && mvn spring-boot:run"
timeout /t 20

echo Starting Payment Service (8085)...
start "Payment Service" cmd /k "cd backend-services\payment-service && mvn spring-boot:run"
timeout /t 20

echo Starting Delivery Service (8086)...
start "Delivery Service" cmd /k "cd backend-services\delivery-service && mvn spring-boot:run"
timeout /t 20

echo.
echo [2/4] Starting API Gateway (8090)...
start "API Gateway" cmd /k "cd backend-services\api-gateway && mvn spring-boot:run"
timeout /t 25

echo.
echo [3/4] Installing Frontend Dependencies...
cd frontend-services\shell-app
if not exist "node_modules" (
    echo Installing npm packages...
    call npm install
)
cd ..\..

echo.
echo [4/4] Starting Frontend (4200)...
start "Frontend" cmd /k "cd frontend-services\shell-app && npm start"

echo.
echo ========================================
echo SERVICES STARTING!
echo ========================================
echo.
echo Wait 2-3 minutes, then open:
echo http://localhost:4200
echo.
echo API Gateway: http://localhost:8090
echo Test API: http://localhost:8090/api/products
echo.
pause
