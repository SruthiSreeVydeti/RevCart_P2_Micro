@echo off
echo ========================================
echo Checking All Services Status
echo ========================================
echo.

echo Checking Docker containers...
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo.
echo ========================================
echo Service Health Checks
echo ========================================
echo.

echo Checking Consul...
curl -s http://localhost:8500/v1/agent/services | findstr "user-service" >nul && echo [OK] Consul is running || echo [FAIL] Consul not accessible

echo.
echo Checking Config Server...
curl -s http://localhost:8888/actuator/health >nul && echo [OK] Config Server is running || echo [FAIL] Config Server not accessible

echo.
echo Checking API Gateway...
curl -s http://localhost:8080/actuator/health >nul && echo [OK] API Gateway is running || echo [FAIL] API Gateway not accessible

echo.
echo ========================================
echo Individual Services
echo ========================================
curl -s http://localhost:8081/actuator/health >nul && echo [OK] User Service (8081) || echo [FAIL] User Service
curl -s http://localhost:8082/actuator/health >nul && echo [OK] Product Service (8082) || echo [FAIL] Product Service
curl -s http://localhost:8083/actuator/health >nul && echo [OK] Cart Service (8083) || echo [FAIL] Cart Service
curl -s http://localhost:8084/actuator/health >nul && echo [OK] Order Service (8084) || echo [FAIL] Order Service
curl -s http://localhost:8085/actuator/health >nul && echo [OK] Payment Service (8085) || echo [FAIL] Payment Service
curl -s http://localhost:8086/actuator/health >nul && echo [OK] Delivery Service (8086) || echo [FAIL] Delivery Service
curl -s http://localhost:8087/actuator/health >nul && echo [OK] Notification Service (8087) || echo [FAIL] Notification Service
curl -s http://localhost:8088/actuator/health >nul && echo [OK] Analytics Service (8088) || echo [FAIL] Analytics Service

echo.
pause
