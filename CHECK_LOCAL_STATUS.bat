@echo off
echo ========================================
echo RevCart Local Services Status
echo ========================================
echo.

echo [LOCAL DATABASES]
netstat -ano | findstr "3306" | findstr "LISTENING" >nul 2>&1 && echo [OK] MySQL (3306) || echo [X] MySQL (3306) - Start MySQL service
netstat -ano | findstr "27017" | findstr "LISTENING" >nul 2>&1 && echo [OK] MongoDB (27017) || echo [INFO] MongoDB (27017) - Optional
netstat -ano | findstr "6379" | findstr "LISTENING" >nul 2>&1 && echo [OK] Redis (6379) || echo [INFO] Redis (6379) - Optional

echo.
echo [MICROSERVICES]
netstat -ano | findstr "8081" | findstr "LISTENING" >nul 2>&1 && echo [OK] User Service (8081) || echo [X] User Service (8081)
netstat -ano | findstr "8082" | findstr "LISTENING" >nul 2>&1 && echo [OK] Product Service (8082) || echo [X] Product Service (8082)
netstat -ano | findstr "8083" | findstr "LISTENING" >nul 2>&1 && echo [OK] Cart Service (8083) || echo [X] Cart Service (8083)
netstat -ano | findstr "8084" | findstr "LISTENING" >nul 2>&1 && echo [OK] Order Service (8084) || echo [X] Order Service (8084)
netstat -ano | findstr "8085" | findstr "LISTENING" >nul 2>&1 && echo [OK] Payment Service (8085) || echo [X] Payment Service (8085)
netstat -ano | findstr "8086" | findstr "LISTENING" >nul 2>&1 && echo [OK] Delivery Service (8086) || echo [X] Delivery Service (8086)
netstat -ano | findstr "8090" | findstr "LISTENING" >nul 2>&1 && echo [OK] API Gateway (8090) || echo [X] API Gateway (8090)

echo.
echo [FRONTEND]
netstat -ano | findstr "4200" | findstr "LISTENING" >nul 2>&1 && echo [OK] Frontend (4200) || echo [X] Frontend (4200)

echo.
echo ========================================
echo.
echo Frontend: http://localhost:4200
echo API Test: http://localhost:8090/api/products
echo.
pause