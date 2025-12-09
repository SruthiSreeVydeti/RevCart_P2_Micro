@echo off
echo ========================================
echo Restarting All Services with Fixed Consul Config
echo ========================================
echo.

echo Killing all Java processes...
taskkill /F /IM java.exe /T 2>nul
timeout /t 5 /nobreak >nul

echo.
echo Starting Config Server...
start "Config-Server" cmd /c "cd infrastructure\config-server && mvn spring-boot:run"
timeout /t 15 /nobreak >nul

echo Starting API Gateway...
start "API-Gateway" cmd /c "cd backend-services\api-gateway && mvn spring-boot:run"
timeout /t 10 /nobreak >nul

echo Starting User Service...
start "User-Service" cmd /c "cd backend-services\user-service && mvn spring-boot:run"
timeout /t 5 /nobreak >nul

echo Starting Product Service...
start "Product-Service" cmd /c "cd backend-services\product-service && mvn spring-boot:run"
timeout /t 5 /nobreak >nul

echo Starting Cart Service...
start "Cart-Service" cmd /c "cd backend-services\cart-service && mvn spring-boot:run"
timeout /t 5 /nobreak >nul

echo Starting Order Service...
start "Order-Service" cmd /c "cd backend-services\order-service && mvn spring-boot:run"
timeout /t 5 /nobreak >nul

echo Starting Payment Service...
start "Payment-Service" cmd /c "cd backend-services\payment-service && mvn spring-boot:run"
timeout /t 5 /nobreak >nul

echo Starting Delivery Service...
start "Delivery-Service" cmd /c "cd backend-services\delivery-service && mvn spring-boot:run"
timeout /t 5 /nobreak >nul

echo Starting Notification Service...
start "Notification-Service" cmd /c "cd backend-services\notification-service && mvn spring-boot:run"
timeout /t 5 /nobreak >nul

echo Starting Analytics Service...
start "Analytics-Service" cmd /c "cd backend-services\analytics-service && mvn spring-boot:run"

echo.
echo ========================================
echo All services are starting...
echo Wait 2 minutes then check: http://localhost:8500
echo ========================================
