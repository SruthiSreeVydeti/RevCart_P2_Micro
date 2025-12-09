@echo off
echo Starting all Micro Frontends...

start "Shell App" cmd /k "cd D:\RevCart-Microservices\frontend-services\shell-app && npm start"
timeout /t 5

start "Auth MFE" cmd /k "cd D:\RevCart-Microservices\frontend-services\auth-mfe && npm start"
timeout /t 3

start "Product MFE" cmd /k "cd D:\RevCart-Microservices\frontend-services\product-mfe && npm start"
timeout /t 3

start "Cart MFE" cmd /k "cd D:\RevCart-Microservices\frontend-services\cart-mfe && npm start"
timeout /t 3

start "Orders MFE" cmd /k "cd D:\RevCart-Microservices\frontend-services\orders-mfe && npm start"
timeout /t 3

start "Profile MFE" cmd /k "cd D:\RevCart-Microservices\frontend-services\profile-mfe && npm start"
timeout /t 3

start "Delivery MFE" cmd /k "cd D:\RevCart-Microservices\frontend-services\delivery-mfe && npm start"
timeout /t 3

start "Notifications MFE" cmd /k "cd D:\RevCart-Microservices\frontend-services\notifications-mfe && npm start"

echo All Micro Frontends are starting...
echo Shell App will be available at http://localhost:4200
pause