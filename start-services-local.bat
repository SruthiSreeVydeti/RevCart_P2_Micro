@echo off
echo Starting services locally with Consul...

echo Starting User Service...
start "User-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\user-service; mvn spring-boot:run"

timeout /t 3 /nobreak >nul

echo Starting Product Service...
start "Product-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\product-service; mvn spring-boot:run"

timeout /t 3 /nobreak >nul

echo Starting Order Service...
start "Order-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\order-service; mvn spring-boot:run"

timeout /t 3 /nobreak >nul

echo Starting Payment Service...
start "Payment-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\payment-service; mvn spring-boot:run"

timeout /t 3 /nobreak >nul

echo Starting Delivery Service...
start "Delivery-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\delivery-service; mvn spring-boot:run"

timeout /t 5 /nobreak >nul

echo Starting API Gateway...
start "API-Gateway" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\api-gateway; mvn spring-boot:run"

echo Services starting...
echo Check Consul: http://localhost:8500
echo API Gateway: http://localhost:8090
echo User Service: http://localhost:8081
echo Product Service: http://localhost:8082
echo Order Service: http://localhost:8084
echo Payment Service: http://localhost:8085
echo Delivery Service: http://localhost:8086