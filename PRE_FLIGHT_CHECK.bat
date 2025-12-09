@echo off
color 0B
echo ========================================
echo RevCart - Pre-Flight System Check
echo ========================================
echo.

set ERROR_COUNT=0

echo [1/5] Checking Java...
java -version >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Java is installed
    java -version 2>&1 | findstr "17" >nul
    if %errorlevel% equ 0 (
        echo [OK] Java 17 detected
    ) else (
        echo [WARNING] Java 17 recommended
    )
) else (
    echo [ERROR] Java not found!
    set /a ERROR_COUNT+=1
)
echo.

echo [2/5] Checking Maven...
mvn -version >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Maven is installed
) else (
    echo [ERROR] Maven not found!
    set /a ERROR_COUNT+=1
)
echo.

echo [3/5] Checking Node.js...
where node >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Node.js is installed
) else (
    echo [ERROR] Node.js not found!
    set /a ERROR_COUNT+=1
)
echo.

echo [4/5] Checking Docker...
docker --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Docker is installed
    docker ps >nul 2>&1
    if %errorlevel% equ 0 (
        echo [OK] Docker is running
    ) else (
        echo [ERROR] Docker is not running! Start Docker Desktop.
        set /a ERROR_COUNT+=1
    )
) else (
    echo [ERROR] Docker not found!
    set /a ERROR_COUNT+=1
)
echo.

echo [5/5] Checking if ports are free...
netstat -ano | findstr "8090" | findstr "LISTENING" >nul 2>&1
if %errorlevel% equ 0 (
    echo [WARNING] Port 8090 is in use - Run STOP_ALL.bat first
    set /a ERROR_COUNT+=1
) else (
    echo [OK] Port 8090 is free
)

netstat -ano | findstr "4200" | findstr "LISTENING" >nul 2>&1
if %errorlevel% equ 0 (
    echo [WARNING] Port 4200 is in use - Run STOP_ALL.bat first
    set /a ERROR_COUNT+=1
) else (
    echo [OK] Port 4200 is free
)
echo.

echo ========================================
echo RESULT
echo ========================================
if %ERROR_COUNT% equ 0 (
    echo [SUCCESS] All checks passed!
    echo You can run: START_PROJECT_NOW.bat
) else (
    echo [FAILED] %ERROR_COUNT% issue(s) found
    echo Please fix the errors above before starting
)
echo ========================================
echo.
pause
