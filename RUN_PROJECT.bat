@echo off
echo ========================================
echo RevCart Microservices - Complete Startup
echo ========================================
echo.

echo Step 1: Starting Consul (Service Discovery)...
cd infrastructure\consul
start "Consul" cmd /k "docker-compose up"
cd ..\..
timeout /t 15

echo.
echo Step 2: Starting Databases (MySQL, MongoDB, Redis)...
docker-compose up -d mysql-users mysql-products mysql-orders mysql-payments mysql-delivery mongodb redis
timeout /t 20

echo.
echo Step 3: Starting Config Server...
start "Config Server" cmd /k "cd infrastructure\config-server && mvn spring-boot:run"
timeout /t 30

echo.
echo Step 4: Starting Microservices...
start "User Service" cmd /k "cd backend-services\user-service && mvn spring-boot:run"
timeout /t 5
start "Product Service" cmd /k "cd backend-services\product-service && mvn spring-boot:run"
timeout /t 5
start "Cart Service" cmd /k "cd backend-services\cart-service && mvn spring-boot:run"
timeout /t 5
start "Order Service" cmd /k "cd backend-services\order-service && mvn spring-boot:run"
timeout /t 5
start "Payment Service" cmd /k "cd backend-services\payment-service && mvn spring-boot:run"
timeout /t 5
start "Delivery Service" cmd /k "cd backend-services\delivery-service && mvn spring-boot:run"
timeout /t 5
start "Notification Service" cmd /k "cd backend-services\notification-service && mvn spring-boot:run"
timeout /t 5
start "Analytics Service" cmd /k "cd backend-services\analytics-service && mvn spring-boot:run"
timeout /t 10

echo.
echo Step 5: Starting API Gateway...
start "API Gateway" cmd /k "cd backend-services\api-gateway && mvn spring-boot:run"
timeout /t 30

echo.
echo Step 6: Starting Frontend...
start "Frontend Shell" cmd /k "cd frontend-services\shell-app && npm start"

echo.
echo ========================================
echo All services are starting!
echo ========================================
echo.
echo Wait 3-5 minutes for all services to be ready
echo.
echo Access Points:
echo - Frontend UI:    http://localhost:4200
echo - API Gateway:    http://localhost:8080
echo - Consul UI:      http://localhost:8500
echo - Config Server:  http://localhost:8888
echo.
echo Individual Services:
echo - User Service:         http://localhost:8081
echo - Product Service:      http://localhost:8082
echo - Cart Service:         http://localhost:8083
echo - Order Service:        http://localhost:8084
echo - Payment Service:      http://localhost:8085
echo - Delivery Service:     http://localhost:8086
echo - Notification Service: http://localhost:8087
echo - Analytics Service:    http://localhost:8088
echo.
echo ========================================
pause
