@echo off
echo Stopping all services...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8081" ^| findstr "LISTENING"') do taskkill /F /PID %%a 2>nul
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8082" ^| findstr "LISTENING"') do taskkill /F /PID %%a 2>nul
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8083" ^| findstr "LISTENING"') do taskkill /F /PID %%a 2>nul
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8084" ^| findstr "LISTENING"') do taskkill /F /PID %%a 2>nul
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8085" ^| findstr "LISTENING"') do taskkill /F /PID %%a 2>nul
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8086" ^| findstr "LISTENING"') do taskkill /F /PID %%a 2>nul
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8090" ^| findstr "LISTENING"') do taskkill /F /PID %%a 2>nul
timeout /t 5

echo Starting services...
start "User Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\user-service && mvn spring-boot:run"
timeout /t 20
start "Product Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\product-service && mvn spring-boot:run"
timeout /t 20
start "Cart Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\cart-service && mvn spring-boot:run"
timeout /t 20
start "Order Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\order-service && mvn spring-boot:run"
timeout /t 20
start "Payment Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\payment-service && mvn spring-boot:run"
timeout /t 20
start "Delivery Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\delivery-service && mvn spring-boot:run"
timeout /t 20
start "API Gateway" cmd /k "cd /d d:\RevCart-Microservices\backend-services\api-gateway && mvn spring-boot:run"

echo Done! Wait 3 minutes, refresh http://localhost:4200
pause
