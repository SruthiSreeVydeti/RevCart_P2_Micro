@echo off
echo ========================================
echo Stopping All Local Services
echo ========================================
echo.

echo Stopping Java processes...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8081" ^| findstr "LISTENING"') do taskkill /F /PID %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8082" ^| findstr "LISTENING"') do taskkill /F /PID %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8083" ^| findstr "LISTENING"') do taskkill /F /PID %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8084" ^| findstr "LISTENING"') do taskkill /F /PID %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8085" ^| findstr "LISTENING"') do taskkill /F /PID %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8086" ^| findstr "LISTENING"') do taskkill /F /PID %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8087" ^| findstr "LISTENING"') do taskkill /F /PID %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8088" ^| findstr "LISTENING"') do taskkill /F /PID %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8090" ^| findstr "LISTENING"') do taskkill /F /PID %%a >nul 2>&1

echo.
echo Stopping Node processes...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":4200" ^| findstr "LISTENING"') do taskkill /F /PID %%a >nul 2>&1

echo.
echo [OK] All microservices stopped!
echo.
echo NOTE: MongoDB, Redis, and MySQL services are still running
echo To stop them manually:
echo - MongoDB: net stop MongoDB
echo - Redis: net stop Redis
echo - MySQL: net stop MySQL80
echo.
pause