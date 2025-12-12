@echo off
echo ========================================
echo RevCart Services Status Check
echo ========================================
echo.

echo [DATABASES]
netstat -ano | findstr "3307" | findstr "LISTENING" >nul 2>&1 && echo [OK] MySQL Users (3307) || echo [X] MySQL Users (3307)
netstat -ano | findstr "3308" | findstr "LISTENING" >nul 2>&1 && echo [OK] MySQL Products (3308) || echo [X] MySQL Products (3308)
netstat -ano | findstr "3309" | findstr "LISTENING" >nul 2>&1 && echo [OK] MySQL Orders (3309) || echo [X] MySQL Orders (3309)
netstat -ano | findstr "3310" | findstr "LISTENING" >nul 2>&1 && echo [OK] MySQL Payments (3310) || echo [X] MySQL Payments (3310)
netstat -ano | findstr "3311" | findstr "LISTENING" >nul 2>&1 && echo [OK] MySQL Delivery (3311) || echo [X] MySQL Delivery (3311)
netstat -ano | findstr "27018" | findstr "LISTENING" >nul 2>&1 && echo [OK] MongoDB (27018) || echo [X] MongoDB (27018)
netstat -ano | findstr "6379" | findstr "LISTENING" >nul 2>&1 && echo [OK] Redis (6379) || echo [X] Redis (6379)

echo.
echo [INFRASTRUCTURE]
netstat -ano | findstr "8500" | findstr "LISTENING" >nul 2>&1 && echo [OK] Consul (8500) || echo [X] Consul (8500)

echo.
echo [MICROSERVICES]
netstat -ano | findstr "8081" | findstr "LISTENING" >nul 2>&1 && echo [OK] User Service (8081) || echo [X] User Service (8081)
netstat -ano | findstr "8082" | findstr "LISTENING" >nul 2>&1 && echo [OK] Product Service (8082) || echo [X] Product Service (8082)
netstat -ano | findstr "8083" | findstr "LISTENING" >nul 2>&1 && echo [OK] Cart Service (8083) || echo [X] Cart Service (8083)
netstat -ano | findstr "8084" | findstr "LISTENING" >nul 2>&1 && echo [OK] Order Service (8084) || echo [X] Order Service (8084)
netstat -ano | findstr "8085" | findstr "LISTENING" >nul 2>&1 && echo [OK] Payment Service (8085) || echo [X] Payment Service (8085)
netstat -ano | findstr "8086" | findstr "LISTENING" >nul 2>&1 && echo [OK] Delivery Service (8086) || echo [X] Delivery Service (8086)
netstat -ano | findstr "8087" | findstr "LISTENING" >nul 2>&1 && echo [OK] Notification Service (8087) || echo [X] Notification Service (8087)
netstat -ano | findstr "8088" | findstr "LISTENING" >nul 2>&1 && echo [OK] Analytics Service (8088) || echo [X] Analytics Service (8088)
netstat -ano | findstr "8090" | findstr "LISTENING" >nul 2>&1 && echo [OK] API Gateway (8090) || echo [X] API Gateway (8090)

echo.
echo [FRONTEND]
netstat -ano | findstr "4200" | findstr "LISTENING" >nul 2>&1 && echo [OK] Frontend (4200) || echo [X] Frontend (4200)

echo.
echo ========================================
echo.
echo To test API: curl http://localhost:8090/api/products
echo To access app: http://localhost:4200
echo Consul UI: http://localhost:8500
echo.
pause