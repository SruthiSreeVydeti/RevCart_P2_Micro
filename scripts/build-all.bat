@echo off
echo Building all microservices...

echo Building Config Server...
cd infrastructure\config-server
call mvn clean package -DskipTests
cd ..\..

echo Building API Gateway...
cd backend-services\api-gateway
call mvn clean package -DskipTests
cd ..\..

echo Building User Service...
cd backend-services\user-service
call mvn clean package -DskipTests
cd ..\..

echo Building Product Service...
cd backend-services\product-service
call mvn clean package -DskipTests
cd ..\..

echo All services built successfully!
pause