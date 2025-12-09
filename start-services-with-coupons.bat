@echo off
echo Starting Product Service with Coupon API...
cd backend-services\product-service
start "Product Service" cmd /k "mvn spring-boot:run"
timeout /t 15

echo Starting API Gateway...
cd ..\api-gateway
start "API Gateway" cmd /k "mvn spring-boot:run"

echo Services starting...
