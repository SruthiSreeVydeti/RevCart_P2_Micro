@echo off
echo Restarting Docker Desktop...
echo.

echo Step 1: Stopping Docker Desktop...
taskkill /F /IM "Docker Desktop.exe" 2>nul
timeout /t 5

echo Step 2: Starting Docker Desktop...
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"

echo.
echo Waiting 60 seconds for Docker to start...
timeout /t 60

echo.
echo Testing Docker...
docker --version
docker ps

echo.
echo Docker should be ready now!
pause
