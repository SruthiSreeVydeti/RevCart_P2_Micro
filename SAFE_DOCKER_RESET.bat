@echo off
echo ========================================
echo Safe Docker Reset with Data Backup
echo ========================================
echo.

echo Step 1: Backing up Docker volumes...
docker volume ls -q > volumes_backup.txt
echo Volumes list saved to volumes_backup.txt

echo.
echo Step 2: Your data is in Docker volumes:
docker volume ls

echo.
echo ========================================
echo IMPORTANT: Your data is SAFE
echo ========================================
echo.
echo Docker volumes are stored separately and will NOT be deleted.
echo Factory reset only resets Docker settings, not volumes.
echo.
echo Your MySQL, MongoDB, Redis data will remain intact.
echo.
echo Press any key to continue with reset...
pause >nul

echo.
echo Step 3: Stopping Docker Desktop...
taskkill /F /IM "Docker Desktop.exe" 2>nul
timeout /t 3 /nobreak >nul

echo.
echo Step 4: Shutting down WSL...
wsl --shutdown
timeout /t 5 /nobreak >nul

echo.
echo ========================================
echo MANUAL STEP - Factory Reset
echo ========================================
echo.
echo 1. Open Docker Desktop
echo 2. Settings → Troubleshoot → "Reset to factory defaults"
echo 3. IMPORTANT: Do NOT check "Remove all data"
echo 4. Click Reset
echo 5. Wait for Docker to restart
echo.
echo Press any key after Docker Desktop is running...
pause >nul

echo.
echo Step 5: Verifying volumes are still there...
docker volume ls
echo.
echo Comparing with backup...
fc volumes_backup.txt <(docker volume ls -q) 2>nul

echo.
echo Step 6: Starting services...
cd d:\RevCart-Microservices

docker compose -f infrastructure\consul\docker-compose.yml up -d
timeout /t 15 /nobreak >nul

docker compose up -d
timeout /t 120 /nobreak >nul

echo.
echo Step 7: Testing...
curl http://localhost:8090/api/products

echo.
docker ps --format "table {{.Names}}\t{{.Status}}"

echo.
echo ========================================
echo DONE! Your data is preserved.
echo ========================================
pause
