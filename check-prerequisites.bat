@echo off
echo ========================================
echo Checking Prerequisites
echo ========================================
echo.

echo [1] Checking MySQL on port 3307...
netstat -ano | findstr "3307" >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] MySQL is running on port 3307
) else (
    echo [ERROR] MySQL is NOT running on port 3307
    echo Please start MySQL on port 3307
)
echo.

echo [2] Checking MongoDB on port 27017...
netstat -ano | findstr "27017" >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] MongoDB is running on port 27017
) else (
    echo [ERROR] MongoDB is NOT running on port 27017
    echo Please start MongoDB
)
echo.

echo [3] Checking Redis on port 6379...
netstat -ano | findstr "6379" >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Redis is running on port 6379
) else (
    echo [ERROR] Redis is NOT running on port 6379
    echo Please start Redis (optional for cart-service)
)
echo.

echo [4] Checking Consul on port 8500...
curl -s http://localhost:8500/v1/agent/self >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Consul is running on port 8500
) else (
    echo [ERROR] Consul is NOT running
    echo Run: cd infrastructure\consul ^&^& docker-compose up -d
)
echo.

echo ========================================
echo Summary
echo ========================================
echo.
echo Services that need MySQL (port 3307):
echo - user-service
echo - product-service
echo - cart-service
echo - order-service
echo - payment-service
echo - delivery-service
echo.
echo Services that need MongoDB (port 27017):
echo - notification-service
echo - analytics-service
echo.
pause
