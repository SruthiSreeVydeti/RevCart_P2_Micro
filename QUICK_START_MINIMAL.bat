@echo off
color 0E
echo ========================================
echo RevCart - MINIMAL QUICK START
echo ========================================
echo.
echo Starting ONLY Product Service + API Gateway + Frontend
echo (Enough to see the integration working)
echo.

echo [1/3] Starting Product Service (Port 8082)...
start "Product Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\product-service && mvn spring-boot:run"
echo Waiting 30 seconds for Product Service to start...
timeout /t 30

echo.
echo [2/3] Starting API Gateway (Port 8090)...
start "API Gateway" cmd /k "cd /d d:\RevCart-Microservices\backend-services\api-gateway && mvn spring-boot:run"
echo Waiting 30 seconds for API Gateway to start...
timeout /t 30

echo.
echo [3/3] Checking Frontend dependencies...
cd frontend-services\shell-app
if not exist "node_modules" (
    echo Installing npm packages (first time only)...
    call npm install
)

echo.
echo Starting Frontend (Port 4200)...
start "Frontend" cmd /k "npm start"
cd ..\..

echo.
echo ========================================
echo SERVICES STARTING!
echo ========================================
echo.
echo Wait 2 minutes, then test:
echo.
echo Frontend:  http://localhost:4200
echo API:       http://localhost:8090/api/products
echo Gateway:   http://localhost:8090
echo.
echo 3 windows opened - keep them open!
echo.
pause
