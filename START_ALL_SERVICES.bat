@echo off
color 0A
echo Starting ALL Services...
echo.

echo [1] User Service (8081)...
start "User Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\user-service && mvn spring-boot:run"
timeout /t 20

echo [2] Product Service (8082)...
start "Product Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\product-service && mvn spring-boot:run"
timeout /t 20

echo [3] Cart Service (8083)...
start "Cart Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\cart-service && mvn spring-boot:run"
timeout /t 20

echo [4] Order Service (8084)...
start "Order Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\order-service && mvn spring-boot:run"
timeout /t 20

echo [5] Payment Service (8085)...
start "Payment Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\payment-service && mvn spring-boot:run"
timeout /t 20

echo [6] Delivery Service (8086)...
start "Delivery Service" cmd /k "cd /d d:\RevCart-Microservices\backend-services\delivery-service && mvn spring-boot:run"
timeout /t 20

echo [7] API Gateway (8090)...
start "API Gateway" cmd /k "cd /d d:\RevCart-Microservices\backend-services\api-gateway && mvn spring-boot:run"

echo.
echo ALL SERVICES STARTING!
echo Wait 3 minutes, then refresh http://localhost:4200
pause
