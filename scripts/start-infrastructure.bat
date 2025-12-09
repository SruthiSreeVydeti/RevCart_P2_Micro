@echo off
echo Starting infrastructure services...

echo Starting Consul and databases...
docker-compose up -d consul mysql-users mysql-products mysql-orders mongodb

echo Waiting for services to be ready...
timeout /t 30

echo Starting Config Server...
docker-compose up -d config-server

echo Waiting for Config Server...
timeout /t 20

echo Infrastructure services started!
echo Consul UI: http://localhost:8500
echo Config Server: http://localhost:8888
pause