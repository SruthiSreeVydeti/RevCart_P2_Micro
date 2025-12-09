@echo off
color 0C
echo ========================================
echo DOCKER DESKTOP IS NOT RUNNING!
echo ========================================
echo.
echo Please follow these steps:
echo.
echo 1. Open Docker Desktop application
echo 2. Wait for it to fully start (icon turns green)
echo 3. Run this script again
echo.
echo Starting Docker Desktop now...
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
echo.
echo Waiting 30 seconds for Docker to start...
timeout /t 30
echo.
echo Checking Docker status...
docker ps >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Docker is running!
    echo.
    echo Now run: START_PROJECT_NOW.bat
) else (
    echo [ERROR] Docker is still not ready
    echo Please wait 1 more minute and run START_PROJECT_NOW.bat
)
echo.
pause
