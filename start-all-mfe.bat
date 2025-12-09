@echo off
echo Starting all Micro Frontends...

start "Shell App" cmd /k "cd frontend-services\shell-app && npm start"
timeout /t 3 /nobreak >nul

start "Auth MFE" cmd /k "cd frontend-services\auth-mfe && npm start"
timeout /t 2 /nobreak >nul

start "Product MFE" cmd /k "cd frontend-services\product-mfe && npm start"
timeout /t 2 /nobreak >nul

start "Cart MFE" cmd /k "cd frontend-services\cart-mfe && npm start"
timeout /t 2 /nobreak >nul

start "Orders MFE" cmd /k "cd frontend-services\orders-mfe && npm start"
timeout /t 2 /nobreak >nul

start "Profile MFE" cmd /k "cd frontend-services\profile-mfe && npm start"
timeout /t 2 /nobreak >nul

start "Delivery MFE" cmd /k "cd frontend-services\delivery-mfe && npm start"
timeout /t 2 /nobreak >nul

start "Notifications MFE" cmd /k "cd frontend-services\notifications-mfe && npm start"

echo All Micro Frontends are starting...
echo Shell App: http://localhost:4200
echo Auth: http://localhost:4201
echo Product: http://localhost:4202
echo Cart: http://localhost:4203
echo Orders: http://localhost:4204
echo Profile: http://localhost:4205
echo Delivery: http://localhost:4206
echo Notifications: http://localhost:4207
pause
