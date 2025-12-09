@echo off
echo ========================================
echo RevCart Services Health Check
echo ========================================
echo.

echo Checking Consul...
curl -s http://localhost:8500/v1/agent/self >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Consul is running on http://localhost:8500
) else (
    echo [ERROR] Consul is NOT running
)
echo.

echo Checking Config Server...
curl -s http://localhost:8888/actuator/health >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Config Server is running on port 8888
) else (
    echo [ERROR] Config Server is NOT running
)
echo.

echo Checking API Gateway...
curl -s http://localhost:8080/actuator/health >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] API Gateway is running on port 8080
) else (
    echo [ERROR] API Gateway is NOT running
)
echo.

echo Checking User Service...
curl -s http://localhost:8081/actuator/health >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] User Service is running on port 8081
) else (
    echo [ERROR] User Service is NOT running
)
echo.

echo Checking Product Service...
curl -s http://localhost:8082/actuator/health >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Product Service is running on port 8082
) else (
    echo [ERROR] Product Service is NOT running
)
echo.

echo Checking Cart Service...
curl -s http://localhost:8083/actuator/health >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Cart Service is running on port 8083
) else (
    echo [ERROR] Cart Service is NOT running
)
echo.

echo Checking Order Service...
curl -s http://localhost:8084/actuator/health >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Order Service is running on port 8084
) else (
    echo [ERROR] Order Service is NOT running
)
echo.

echo Checking Payment Service...
curl -s http://localhost:8085/actuator/health >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Payment Service is running on port 8085
) else (
    echo [ERROR] Payment Service is NOT running
)
echo.

echo Checking Delivery Service...
curl -s http://localhost:8086/actuator/health >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Delivery Service is running on port 8086
) else (
    echo [ERROR] Delivery Service is NOT running
)
echo.

echo Checking Notification Service...
curl -s http://localhost:8087/actuator/health >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Notification Service is running on port 8087
) else (
    echo [ERROR] Notification Service is NOT running
)
echo.

echo Checking Analytics Service...
curl -s http://localhost:8088/actuator/health >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Analytics Service is running on port 8088
) else (
    echo [ERROR] Analytics Service is NOT running
)
echo.

echo ========================================
echo Checking Consul Service Registry...
echo ========================================
curl -s http://localhost:8500/v1/agent/services 2>nul | findstr "Service"
echo.

echo ========================================
echo Health Check Complete
echo ========================================
echo.
echo To view all registered services, visit:
echo http://localhost:8500/ui/dc1/services
echo.
pause
