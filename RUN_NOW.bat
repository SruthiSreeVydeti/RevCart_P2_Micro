@echo off
color 0A
echo ========================================
echo Starting RevCart Application
echo ========================================
echo.

echo [1/3] Starting Product Service (8082)...
start "Product Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\product-service && mvn spring-boot:run"
timeout /t 25

echo [2/3] Starting API Gateway (8090)...
start "API Gateway" cmd /k "cd /d d:\RevCart-Microservices\backend-services\api-gateway && mvn spring-boot:run"
timeout /t 25

echo [3/3] Starting Frontend (4200)...
cd frontend-services\shell-app
if not exist "node_modules" (
    echo Installing dependencies...
    call npm install
)
start "Frontend" cmd /k "npm start"
cd ..\..

echo.
echo ========================================
echo SERVICES STARTING!
echo ========================================
echo.
echo Wait 2 minutes, then open:
echo http://localhost:4200
echo.
echo Test API: http://localhost:8090/api/products
echo.
pause
