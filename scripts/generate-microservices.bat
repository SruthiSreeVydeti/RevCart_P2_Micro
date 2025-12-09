@echo off
echo ========================================
echo RevCart Microservices Generator
echo ========================================

cd /d %~dp0..

echo Creating User Service...
call :create_service user-service 8081 MySQL "Authentication, profile, address"

echo Creating Product Service...
call :create_service product-service 8082 MySQL "Product catalog, pricing, categories"

echo Creating Cart Service...
call :create_service cart-service 8083 Redis "Cart management, session persistence"

echo Creating Order Service...
call :create_service order-service 8084 MySQL "Order placement, status, history"

echo Creating Payment Service...
call :create_service payment-service 8085 MySQL "Payment processing, Razorpay"

echo Creating Delivery Service...
call :create_service delivery-service 8086 MySQL "Delivery tracking, agent management"

echo Creating Notification Service...
call :create_service notification-service 8087 MongoDB "Email, WebSocket notifications"

echo Creating Analytics Service...
call :create_service analytics-service 8088 MongoDB "Sales trends, customer insights"

echo ========================================
echo All microservices structure created!
echo ========================================
goto :eof

:create_service
set SERVICE_NAME=%1
set PORT=%2
set DB=%3
set DESC=%4
echo   - %SERVICE_NAME% [Port: %PORT%, DB: %DB%]
mkdir backend-services\%SERVICE_NAME%\src\main\java\com\revcart\%SERVICE_NAME%\controller 2>nul
mkdir backend-services\%SERVICE_NAME%\src\main\java\com\revcart\%SERVICE_NAME%\service 2>nul
mkdir backend-services\%SERVICE_NAME%\src\main\java\com\revcart\%SERVICE_NAME%\repository 2>nul
mkdir backend-services\%SERVICE_NAME%\src\main\java\com\revcart\%SERVICE_NAME%\entity 2>nul
mkdir backend-services\%SERVICE_NAME%\src\main\java\com\revcart\%SERVICE_NAME%\dto 2>nul
mkdir backend-services\%SERVICE_NAME%\src\main\java\com\revcart\%SERVICE_NAME%\config 2>nul
mkdir backend-services\%SERVICE_NAME%\src\main\resources 2>nul
mkdir backend-services\%SERVICE_NAME%\src\test\java 2>nul
goto :eof
