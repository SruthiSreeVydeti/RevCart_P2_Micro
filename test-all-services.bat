@echo off
echo Testing all microservices via API calls...

echo Testing User Service...
curl -s http://localhost:8081/actuator/health | findstr "UP" && echo User Service: PASS || echo User Service: FAIL

echo Testing Product Service...
curl -s http://localhost:8082/actuator/health | findstr "UP" && echo Product Service: PASS || echo Product Service: FAIL

echo Testing Cart Service...
curl -s http://localhost:8083/actuator/health | findstr "UP" && echo Cart Service: PASS || echo Cart Service: FAIL

echo Testing Order Service...
curl -s http://localhost:8084/actuator/health | findstr "UP" && echo Order Service: PASS || echo Order Service: FAIL

echo Testing Payment Service...
curl -s http://localhost:8085/actuator/health | findstr "UP" && echo Payment Service: PASS || echo Payment Service: FAIL

echo Testing Delivery Service...
curl -s http://localhost:8086/actuator/health | findstr "UP" && echo Delivery Service: PASS || echo Delivery Service: FAIL

echo Testing API Gateway...
curl -s http://localhost:8090/actuator/health | findstr "UP" && echo API Gateway: PASS || echo API Gateway: FAIL

echo Testing Consul...
curl -s http://localhost:8500/v1/status/leader && echo Consul: PASS || echo Consul: FAIL

echo.
echo Testing API Gateway Routes...
curl -s http://localhost:8090/api/products | findstr "id" && echo Products API: PASS || echo Products API: FAIL
curl -s http://localhost:8090/api/cart/1 | findstr "userId" && echo Cart API: PASS || echo Cart API: FAIL

echo.
echo All tests completed!