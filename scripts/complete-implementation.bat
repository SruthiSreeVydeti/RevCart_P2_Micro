@echo off
echo ========================================
echo RevCart Complete Microservices Implementation
echo ========================================
echo.
echo This script will:
echo 1. Copy code from monolith
echo 2. Create POMs for all services
echo 3. Create application.properties for all services
echo 4. Create main application classes
echo 5. Create Dockerfiles
echo 6. Update package names
echo.
pause

cd /d %~dp0..

echo Step 1: Copying code from monolith...
call scripts\migrate-from-monolith.bat

echo.
echo Step 2: Creating configuration files...
echo This will be done via Amazon Q...

echo.
echo ========================================
echo Manual Steps Required:
echo ========================================
echo.
echo Amazon Q will now create:
echo - 8 pom.xml files
echo - 8 application.properties files  
echo - 8 main application classes
echo - 8 Dockerfiles
echo - Package name updates
echo - OpenFeign client configurations
echo.
echo Total files to create: ~150 files
echo.
echo Please confirm to proceed with automated generation...
pause
