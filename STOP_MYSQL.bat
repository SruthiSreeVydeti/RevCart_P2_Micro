@echo off
echo Stopping MySQL service...
net stop MySQL80
if %ERRORLEVEL% NEQ 0 (
    echo Trying MySQL...
    net stop MySQL
)
if %ERRORLEVEL% NEQ 0 (
    echo Killing MySQL process...
    taskkill /F /PID 4948
)
echo Done!
pause
