@echo off
echo ========================================
echo Starting RevCart Complete Application
echo ========================================

echo.
echo [1/3] Starting Product Service (Port 8082)...
start "Product Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\product-service && mvn spring-boot:run"
timeout /t 30

echo.
echo [2/3] Starting API Gateway (Port 8090)...
start "API Gateway" cmd /k "cd /d d:\RevCart-Microservices\backend-services\api-gateway && mvn spring-boot:run"
timeout /t 30

echo.
echo [3/3] Starting UI (Port 4200)...
start "RevCart UI" cmd /k "cd /d d:\RevCart-Microservices\frontend-services\shell-app && npm start"

echo.
echo ========================================
echo All services are starting...
echo ========================================
echo.
echo Wait 2-3 minutes, then access:
echo - UI: http://localhost:4200
echo - API Gateway: http://localhost:8090
echo - Product Service: http://localhost:8082
echo.
echo Test API: http://localhost:8090/api/products
echo.
pause
