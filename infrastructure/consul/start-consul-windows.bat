@echo off
echo Starting Consul Agent on Windows (without Docker)
echo.
echo Download Consul from: https://www.consul.io/downloads
echo Extract consul.exe to: C:\consul\
echo.
echo Starting Consul...
cd /d C:\consul
start "Consul" consul.exe agent -dev -ui -client=0.0.0.0
echo.
echo Consul UI: http://localhost:8500
echo.
pause
