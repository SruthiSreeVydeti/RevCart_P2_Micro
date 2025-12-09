@echo off
echo Installing dependencies for all Micro Frontends...

echo Installing Shell App...
cd D:\RevCart-Microservices\frontend-services\shell-app
call npm install

echo Installing Auth MFE...
cd ..\auth-mfe
call npm install

echo Installing Product MFE...
cd ..\product-mfe
call npm install

echo Installing Cart MFE...
cd ..\cart-mfe
call npm install

echo Installing Orders MFE...
cd ..\orders-mfe
call npm install

echo Installing Profile MFE...
cd ..\profile-mfe
call npm install

echo Installing Delivery MFE...
cd ..\delivery-mfe
call npm install

echo Installing Notifications MFE...
cd ..\notifications-mfe
call npm install

echo All dependencies installed successfully!
pause