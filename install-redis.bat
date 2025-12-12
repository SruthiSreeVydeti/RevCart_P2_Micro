@echo off
echo Installing Redis for Windows...

echo Downloading Redis...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/microsoftarchive/redis/releases/download/win-3.0.504/Redis-x64-3.0.504.zip' -OutFile 'redis.zip'"

echo Extracting Redis...
powershell -Command "Expand-Archive -Path 'redis.zip' -DestinationPath './redis'"

echo Starting Redis...
start "Redis" ./redis/redis-server.exe

echo Redis installed and started on port 6379
del redis.zip