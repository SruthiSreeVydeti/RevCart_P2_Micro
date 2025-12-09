@echo off
echo Starting RevCart Application...
echo.

echo [1/3] Starting User Service on port 8081...
start "User Service" cmd /k "cd backend-services\user-service && mvn spring-boot:run"
timeout /t 25

echo [2/3] Starting Product Service on port 8082...
start "Product Service" cmd /k "cd backend-services\product-service && mvn spring-boot:run"
timeout /t 25

echo [3/3] Starting UI on port 4200...
start "RevCart UI" cmd /k "cd frontend-services\shell-app && npm start"

echo.
echo ========================================
echo Starting... Please wait 2-3 minutes
echo Then open: http://localhost:4200
echo ========================================
