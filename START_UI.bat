@echo off
echo ========================================
echo Starting RevCart UI
echo ========================================

echo.
echo Step 1: Starting Consul...
cd infrastructure\consul
start "Consul" cmd /k "docker-compose up"
timeout /t 10

echo.
echo Step 2: Starting Config Server...
cd ..\..\infrastructure\config-server
start "Config Server" cmd /k "mvn spring-boot:run"
timeout /t 20

echo.
echo Step 3: Starting API Gateway...
cd ..\..\backend-services\api-gateway
start "API Gateway" cmd /k "mvn spring-boot:run"
timeout /t 20

echo.
echo Step 4: Starting User Service...
cd ..\user-service
start "User Service" cmd /k "mvn spring-boot:run"
timeout /t 15

echo.
echo Step 5: Starting Product Service...
cd ..\product-service
start "Product Service" cmd /k "mvn spring-boot:run"
timeout /t 15

echo.
echo Step 6: Starting Frontend Shell App...
cd ..\..\frontend-services\shell-app
start "Shell App" cmd /k "npm start"

echo.
echo ========================================
echo All services starting...
echo ========================================
echo.
echo Access Points:
echo - UI: http://localhost:4200
echo - API Gateway: http://localhost:8080
echo - Consul: http://localhost:8500
echo - Config Server: http://localhost:8888
echo.
pause
