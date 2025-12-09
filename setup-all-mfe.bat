@echo off
echo Setting up all Micro Frontends...

cd frontend-services

echo Installing Orders MFE...
cd orders-mfe
call npm install
cd ..

echo Installing Profile MFE...
cd profile-mfe
call npm install
cd ..

echo Installing Delivery MFE...
cd delivery-mfe
call npm install
cd ..

echo Installing Notifications MFE...
cd notifications-mfe
call npm install
cd ..

echo All MFEs installed successfully!
pause
