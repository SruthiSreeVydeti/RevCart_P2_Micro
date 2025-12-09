@echo off
echo Creating complete MFE structure...

cd frontend-services

REM Orders MFE
echo Creating Orders MFE...
cd orders-mfe
echo export * from './app.module'; > src\app\index.ts
cd ..

REM Profile MFE
echo Creating Profile MFE...
cd profile-mfe
echo export * from './app.module'; > src\app\index.ts
cd ..

REM Delivery MFE
echo Creating Delivery MFE...
cd delivery-mfe
echo export * from './app.module'; > src\app\index.ts
cd ..

REM Notifications MFE
echo Creating Notifications MFE...
cd notifications-mfe
echo export * from './app.module'; > src\app\index.ts
cd ..

echo MFE structure created!
pause
