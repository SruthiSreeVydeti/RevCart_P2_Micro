@echo off
echo ========================================
echo Docker Desktop Factory Reset
echo ========================================
echo.
echo STEP 1: Stopping Docker Desktop...
taskkill /F /IM "Docker Desktop.exe" 2>nul
timeout /t 3 /nobreak >nul

echo.
echo STEP 2: Shutting down WSL...
wsl --shutdown
timeout /t 5 /nobreak >nul

echo.
echo ========================================
echo MANUAL STEP REQUIRED
echo ========================================
echo.
echo Please do the following:
echo.
echo 1. Open Docker Desktop
echo 2. Click the Settings icon (gear icon)
echo 3. Go to "Troubleshoot" tab
echo 4. Click "Reset to factory defaults"
echo 5. Click "Reset" to confirm
echo 6. Wait for Docker to restart (2-3 minutes)
echo.
echo After Docker Desktop shows "Docker Desktop is running":
echo Press any key to continue...
pause >nul

echo.
echo ========================================
echo Testing Docker...
echo ========================================
docker run hello-world

if %errorlevel% equ 0 (
    echo.
    echo ✓ Docker is working!
    echo.
    echo Starting RevCart services...
    cd d:\RevCart-Microservices
    
    echo Starting Consul...
    docker compose -f infrastructure\consul\docker-compose.yml up -d
    timeout /t 15 /nobreak >nul
    
    echo Starting all microservices...
    docker compose up -d
    
    echo.
    echo Waiting for services to initialize (2 minutes)...
    timeout /t 120 /nobreak >nul
    
    echo.
    echo ========================================
    echo Testing Services...
    echo ========================================
    curl http://localhost:8090/api/products
    
    echo.
    echo ========================================
    echo Service Status:
    echo ========================================
    docker ps --format "table {{.Names}}\t{{.Status}}"
    
    echo.
    echo ========================================
    echo SUCCESS!
    echo ========================================
    echo Frontend: http://localhost:4200
    echo API Gateway: http://localhost:8090
    echo Consul: http://localhost:8500
) else (
    echo.
    echo ✗ Docker test failed
    echo Please try reinstalling Docker Desktop
)

echo.
pause
