@echo off
set /p PASS="Enter MySQL password: "
powershell -Command "(Get-Content 'backend-services\product-service\src\main\resources\application.properties') -replace 'spring.datasource.password=', 'spring.datasource.password=%PASS%' | Set-Content 'backend-services\product-service\src\main\resources\application.properties'"
powershell -Command "(Get-Content 'backend-services\user-service\src\main\resources\application.properties') -replace 'spring.datasource.password=', 'spring.datasource.password=%PASS%' | Set-Content 'backend-services\user-service\src\main\resources\application.properties'"
echo Fixed! Close Product Service window and run: cd backend-services\product-service && mvn spring-boot:run
pause
