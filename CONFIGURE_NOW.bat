@echo off
color 0E
echo ========================================
echo RevCart Configuration Setup
echo ========================================
echo.

set /p MYSQL_PASSWORD="Enter your MySQL root password: "

echo.
echo Updating all service configurations...

powershell -Command "(Get-Content 'backend-services\product-service\src\main\resources\application.properties') -replace 'jdbc:mysql://localhost:3307', 'jdbc:mysql://localhost:3306' -replace 'spring.datasource.password=root', 'spring.datasource.password=%MYSQL_PASSWORD%' | Set-Content 'backend-services\product-service\src\main\resources\application.properties'"

powershell -Command "(Get-Content 'backend-services\user-service\src\main\resources\application.properties') -replace 'jdbc:mysql://localhost:3307', 'jdbc:mysql://localhost:3306' -replace 'spring.datasource.password=root', 'spring.datasource.password=%MYSQL_PASSWORD%' | Set-Content 'backend-services\user-service\src\main\resources\application.properties'"

powershell -Command "(Get-Content 'backend-services\cart-service\src\main\resources\application.properties') -replace 'jdbc:mysql://localhost:3307', 'jdbc:mysql://localhost:3306' -replace 'spring.datasource.password=root', 'spring.datasource.password=%MYSQL_PASSWORD%' | Set-Content 'backend-services\cart-service\src\main\resources\application.properties'"

powershell -Command "(Get-Content 'backend-services\order-service\src\main\resources\application.properties') -replace 'jdbc:mysql://localhost:3307', 'jdbc:mysql://localhost:3306' -replace 'spring.datasource.password=root', 'spring.datasource.password=%MYSQL_PASSWORD%' | Set-Content 'backend-services\order-service\src\main\resources\application.properties'"

powershell -Command "(Get-Content 'backend-services\payment-service\src\main\resources\application.properties') -replace 'jdbc:mysql://localhost:3307', 'jdbc:mysql://localhost:3306' -replace 'spring.datasource.password=root', 'spring.datasource.password=%MYSQL_PASSWORD%' | Set-Content 'backend-services\payment-service\src\main\resources\application.properties'"

powershell -Command "(Get-Content 'backend-services\delivery-service\src\main\resources\application.properties') -replace 'jdbc:mysql://localhost:3307', 'jdbc:mysql://localhost:3306' -replace 'spring.datasource.password=root', 'spring.datasource.password=%MYSQL_PASSWORD%' | Set-Content 'backend-services\delivery-service\src\main\resources\application.properties'"

echo.
echo [OK] All configurations updated!
echo.
echo Now you can run: RUN_NOW.bat
echo.
pause
