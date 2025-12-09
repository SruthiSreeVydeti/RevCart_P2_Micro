@echo off
echo Starting all services with Consul...

start "Config-Server" powershell -NoExit -Command "cd d:\RevCart-Microservices\infrastructure\config-server; mvn spring-boot:run"
timeout /t 3 /nobreak >nul

start "User-Service" powershell -NoExit -Command "cd d:\RevCart-Microservices\backend-services\user-service; mvn spring-boot:run"
start "Product-Service" powershell -NoExit -Command "cd d:\RevCart-Microservices\backend-services\product-service; mvn spring-boot:run"
start "Cart-Service" powershell -NoExit -Command "cd d:\RevCart-Microservices\backend-services\cart-service; mvn spring-boot:run"
start "Order-Service" powershell -NoExit -Command "cd d:\RevCart-Microservices\backend-services\order-service; mvn spring-boot:run"
start "Payment-Service" powershell -NoExit -Command "cd d:\RevCart-Microservices\backend-services\payment-service; mvn spring-boot:run"
start "Delivery-Service" powershell -NoExit -Command "cd d:\RevCart-Microservices\backend-services\delivery-service; mvn spring-boot:run"
start "Notification-Service" powershell -NoExit -Command "cd d:\RevCart-Microservices\backend-services\notification-service; mvn spring-boot:run"
start "Analytics-Service" powershell -NoExit -Command "cd d:\RevCart-Microservices\backend-services\analytics-service; mvn spring-boot:run"

echo All services starting...
echo Check Consul: http://localhost:8500
