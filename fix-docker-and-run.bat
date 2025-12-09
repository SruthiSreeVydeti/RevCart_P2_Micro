@echo off
echo Waiting for Docker to fully start (3 minutes)...
timeout /t 180 /nobreak >nul

echo Testing Docker...
docker ps
if %errorlevel% neq 0 (
    echo Docker not ready, waiting more...
    timeout /t 60 /nobreak >nul
)

echo Removing old containers...
docker rm -f $(docker ps -aq) 2>nul

echo Pruning Docker system...
docker system prune -f

echo Starting Consul...
cd d:\RevCart-Microservices
docker compose -f infrastructure\consul\docker-compose.yml up -d
timeout /t 15 /nobreak >nul

echo Starting all services...
docker compose up -d --force-recreate
timeout /t 180 /nobreak >nul

echo Testing services...
curl http://localhost:8082/api/products
curl http://localhost:8090/api/products

docker ps
pause
