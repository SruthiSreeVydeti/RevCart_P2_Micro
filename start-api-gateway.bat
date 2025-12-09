@echo off
echo Waiting for Docker to be ready...
:RETRY
docker ps >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker not ready yet, waiting...
    timeout /t 10 /nobreak >nul
    goto RETRY
)

echo Docker is ready!
echo.
echo Stopping any process using port 8080...
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :8080') do (
    taskkill /F /PID %%a 2>nul
)

echo.
echo Starting API Gateway...
docker compose up -d api-gateway

echo.
echo Checking all services...
docker ps

echo.
echo ========================================
echo All services should now be running!
echo ========================================
echo.
echo Access Points:
echo - Consul UI: http://localhost:8500
echo - API Gateway: http://localhost:8080
echo - Config Server: http://localhost:8888
echo.
pause
