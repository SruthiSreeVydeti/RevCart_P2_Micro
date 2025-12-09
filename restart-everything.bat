@echo off
echo ========================================
echo RevCart - Complete Restart
echo ========================================
echo.

echo [1/5] Shutting down WSL...
wsl --shutdown
timeout /t 10 /nobreak >nul

echo.
echo [2/5] Starting Docker Desktop...
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
echo Waiting for Docker to initialize (2 minutes)...
timeout /t 120 /nobreak >nul

echo.
echo [3/5] Starting Consul...
cd d:\RevCart-Microservices
docker compose -f infrastructure\consul\docker-compose.yml up -d
timeout /t 10 /nobreak >nul

echo.
echo [4/5] Starting all services...
docker compose up -d
echo Waiting for services to initialize (2 minutes)...
timeout /t 120 /nobreak >nul

echo.
echo [5/5] Testing API Gateway...
curl http://localhost:8090/actuator/health

echo.
echo ========================================
echo Services Status:
echo ========================================
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo.
echo ========================================
echo Testing Product API:
echo ========================================
curl http://localhost:8090/api/products

echo.
echo ========================================
echo DONE! 
echo ========================================
echo.
echo Frontend: http://localhost:4200
echo API Gateway: http://localhost:8090
echo Consul: http://localhost:8500
echo.
pause
