@echo off
echo Fixing all database configurations to use port 3306...
powershell -Command "(Get-Content 'backend-services\cart-service\src\main\resources\application.properties') -replace '3307', '3306' -replace 'password=root', 'password=' | Set-Content 'backend-services\cart-service\src\main\resources\application.properties'"
powershell -Command "(Get-Content 'backend-services\order-service\src\main\resources\application.properties') -replace '3307', '3306' -replace 'password=root', 'password=' | Set-Content 'backend-services\order-service\src\main\resources\application.properties'"
powershell -Command "(Get-Content 'backend-services\payment-service\src\main\resources\application.properties') -replace '3307', '3306' -replace 'password=root', 'password=' | Set-Content 'backend-services\payment-service\src\main\resources\application.properties'"
powershell -Command "(Get-Content 'backend-services\delivery-service\src\main\resources\application.properties') -replace '3307', '3306' -replace 'password=root', 'password=' | Set-Content 'backend-services\delivery-service\src\main\resources\application.properties'"
echo Done! All services now use MySQL on port 3306 with empty password
pause
