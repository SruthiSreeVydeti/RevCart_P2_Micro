@echo off
echo Starting all services with Consul...

echo Starting Consul...
start "Consul" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\infrastructure\consul; docker-compose up"
timeout /t 10 /nobreak >nul

echo Starting Config Server...
start "Config-Server" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\infrastructure\config-server; mvn spring-boot:run"
timeout /t 5 /nobreak >nul

echo Starting Backend Services...
start "User-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\user-service; mvn spring-boot:run"
start "Product-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\product-service; mvn spring-boot:run"
start "Cart-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\cart-service; mvn spring-boot:run"
start "Order-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\order-service; mvn spring-boot:run"
start "Payment-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\payment-service; mvn spring-boot:run"
start "Delivery-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\delivery-service; mvn spring-boot:run"
start "Notification-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\notification-service; mvn spring-boot:run"
start "Analytics-Service" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\analytics-service; mvn spring-boot:run"

timeout /t 5 /nobreak >nul
echo Starting API Gateway...
start "API-Gateway" powershell -NoExit -Command "cd d:\revcart_micro_p2\RevCart_P2\backend-services\api-gateway; mvn spring-boot:run"

echo All services starting...
echo Check Consul: http://localhost:8500
echo API Gateway: http://localhost:8090
