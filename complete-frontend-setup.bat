@echo off
echo ========================================
echo RevCart Frontend Complete Setup
echo ========================================
echo.

cd frontend-services

echo [1/4] Installing Orders MFE...
cd orders-mfe
call npm install
cd ..

echo.
echo [2/4] Setting up Profile MFE...
xcopy /E /I /Y cart-mfe\angular.json profile-mfe\angular.json* >nul
xcopy /E /I /Y cart-mfe\tsconfig.json profile-mfe\tsconfig.json* >nul
xcopy /E /I /Y cart-mfe\tsconfig.app.json profile-mfe\tsconfig.app.json* >nul
xcopy /E /I /Y cart-mfe\src profile-mfe\src >nul
cd profile-mfe
call npm install
cd ..

echo.
echo [3/4] Setting up Delivery MFE...
xcopy /E /I /Y cart-mfe\angular.json delivery-mfe\angular.json* >nul
xcopy /E /I /Y cart-mfe\tsconfig.json delivery-mfe\tsconfig.json* >nul
xcopy /E /I /Y cart-mfe\tsconfig.app.json delivery-mfe\tsconfig.app.json* >nul
xcopy /E /I /Y cart-mfe\src delivery-mfe\src >nul
cd delivery-mfe
call npm install
cd ..

echo.
echo [4/4] Setting up Notifications MFE...
xcopy /E /I /Y cart-mfe\angular.json notifications-mfe\angular.json* >nul
xcopy /E /I /Y cart-mfe\tsconfig.json notifications-mfe\tsconfig.json* >nul
xcopy /E /I /Y cart-mfe\tsconfig.app.json notifications-mfe\tsconfig.app.json* >nul
xcopy /E /I /Y cart-mfe\src notifications-mfe\src >nul
cd notifications-mfe
call npm install
cd ..

echo.
echo ========================================
echo Frontend Setup Complete!
echo ========================================
echo.
echo All Micro Frontends are ready.
echo Run 'start-all-mfe.bat' to start all services.
echo.
pause
