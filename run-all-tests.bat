@echo off
echo Running tests for all microservices...

echo Testing User Service...
cd backend-services\user-service
mvn test
cd ..\..

echo Testing Product Service...
cd backend-services\product-service
mvn test
cd ..\..

echo Testing Cart Service...
cd backend-services\cart-service
mvn test
cd ..\..

echo Testing Order Service...
cd backend-services\order-service
mvn test
cd ..\..

echo Testing Payment Service...
cd backend-services\payment-service
mvn test
cd ..\..

echo Testing Delivery Service...
cd backend-services\delivery-service
mvn test
cd ..\..

echo All tests completed!