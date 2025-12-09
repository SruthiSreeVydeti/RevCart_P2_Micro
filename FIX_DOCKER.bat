@echo off
echo ========================================
echo Docker Desktop Fix
echo ========================================
echo.

echo Killing all Docker processes...
taskkill /F /IM "Docker Desktop.exe" 2>nul
taskkill /F /IM "com.docker.backend.exe" 2>nul
taskkill /F /IM "com.docker.proxy.exe" 2>nul
timeout /t 3

echo.
echo Starting Docker Desktop...
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"

echo.
echo Please wait 90 seconds for Docker to fully start...
echo (Watch for Docker icon in system tray to stop animating)
timeout /t 90

echo.
echo Testing Docker connection...
docker ps

if %ERRORLEVEL% EQU 0 (
    echo.
    echo SUCCESS! Docker is running.
    echo You can now run: cd infrastructure\databases ^&^& docker-compose up -d
) else (
    echo.
    echo Docker is still starting...
    echo Please wait another minute and try: docker ps
)

echo.
pause
