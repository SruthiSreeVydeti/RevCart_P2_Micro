@echo off
echo ========================================
echo Consul Service Verification
echo ========================================
echo.

echo Checking Consul...
curl -s http://localhost:8500/v1/catalog/services
echo.
echo.

echo Checking Service Ports...
netstat -ano | findstr "LISTENING" | findstr ":80"
echo.

echo ========================================
echo Open Consul UI: http://localhost:8500/ui/dc1/services
echo ========================================
pause
