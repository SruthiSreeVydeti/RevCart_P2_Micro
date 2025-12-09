@echo off
echo ========================================
echo Stopping All RevCart Services
echo ========================================
echo.

echo Stopping all Spring Boot services...
taskkill /FI "WINDOWTITLE eq Config-Server-8888*" /F >nul 2>&1
taskkill /FI "WINDOWTITLE eq API-Gateway-8080*" /F >nul 2>&1
taskkill /FI "WINDOWTITLE eq User-Service-8081*" /F >nul 2>&1
taskkill /FI "WINDOWTITLE eq Product-Service-8082*" /F >nul 2>&1
taskkill /FI "WINDOWTITLE eq Cart-Service-8083*" /F >nul 2>&1
taskkill /FI "WINDOWTITLE eq Order-Service-8084*" /F >nul 2>&1
taskkill /FI "WINDOWTITLE eq Payment-Service-8085*" /F >nul 2>&1
taskkill /FI "WINDOWTITLE eq Delivery-Service-8086*" /F >nul 2>&1
taskkill /FI "WINDOWTITLE eq Notification-Service-8087*" /F >nul 2>&1
taskkill /FI "WINDOWTITLE eq Analytics-Service-8088*" /F >nul 2>&1
echo [OK] All Spring Boot services stopped

echo.
echo Stopping Consul...
cd infrastructure\consul
docker-compose down
echo [OK] Consul stopped

cd ..\..
echo.
echo ========================================
echo All services stopped successfully
echo ========================================
pause
