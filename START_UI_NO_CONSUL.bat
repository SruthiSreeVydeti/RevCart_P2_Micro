@echo off
echo ========================================
echo Starting RevCart UI (Without Consul)
echo ========================================

echo.
echo Step 1: Starting User Service...
cd backend-services\user-service
start "User Service" cmd /k "mvn spring-boot:run"
timeout /t 20

echo.
echo Step 2: Starting Product Service...
cd ..\product-service
start "Product Service" cmd /k "mvn spring-boot:run"
timeout /t 20

echo.
echo Step 3: Starting API Gateway...
cd ..\api-gateway
start "API Gateway" cmd /k "mvn spring-boot:run"
timeout /t 20

echo.
echo Step 4: Starting Frontend...
cd ..\..\frontend-services\shell-app
start "RevCart UI" cmd /k "npm start"

echo.
echo ========================================
echo Services Starting...
echo ========================================
echo.
echo Wait 2-3 minutes, then access:
echo - UI: http://localhost:4200
echo - API: http://localhost:8080
echo.
pause
