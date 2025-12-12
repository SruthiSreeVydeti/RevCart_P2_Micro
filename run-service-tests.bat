@echo off
echo Running service layer tests for all microservices...

echo Testing User Service...
cd backend-services\user-service
mvn test -Dtest=*ServiceTest
cd ..\..

echo Testing Product Service...
cd backend-services\product-service
mvn test -Dtest=*ServiceTest
cd ..\..

echo Testing Cart Service...
cd backend-services\cart-service
mvn test -Dtest=*ServiceTest
cd ..\..

echo Testing Order Service...
cd backend-services\order-service
mvn test -Dtest=*ServiceTest
cd ..\..

echo Testing Payment Service...
cd backend-services\payment-service
mvn test -Dtest=*ServiceTest
cd ..\..

echo Testing Delivery Service...
cd backend-services\delivery-service
mvn test -Dtest=*ServiceTest
cd ..\..

echo All service tests completed!