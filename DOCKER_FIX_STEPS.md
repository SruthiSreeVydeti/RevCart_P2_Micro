# Docker Desktop Fix - Complete Reset

## Problem
Docker Desktop API is returning 500 errors. This is a known WSL2/Windows issue.

## Solution: Complete Docker Reset

### Step 1: Close Everything
```powershell
# Close Docker Desktop completely
Stop-Process -Name "Docker Desktop" -Force

# Shutdown WSL
wsl --shutdown
```

### Step 2: Reset Docker Desktop
1. Open Docker Desktop Settings
2. Go to "Troubleshoot" tab
3. Click "Reset to factory defaults"
4. Confirm and wait for reset to complete
5. Restart Docker Desktop

### Step 3: Alternative - Reinstall Docker Desktop
If reset doesn't work:
1. Uninstall Docker Desktop
2. Delete: `C:\Program Files\Docker`
3. Delete: `%APPDATA%\Docker`
4. Delete: `%LOCALAPPDATA%\Docker`
5. Restart computer
6. Download fresh Docker Desktop from docker.com
7. Install and start

### Step 4: After Docker is Working
```bash
cd d:\RevCart-Microservices

# Start Consul
docker compose -f infrastructure\consul\docker-compose.yml up -d

# Wait 10 seconds
timeout /t 10

# Start all services
docker compose up -d

# Wait 2 minutes
timeout /t 120

# Test
curl http://localhost:8090/api/products
```

## Quick Test
```bash
# This should work if Docker is healthy
docker run hello-world

# This should show containers
docker ps
```

## If Still Not Working

### Option A: Use Docker Compose V1
```bash
# Install docker-compose v1
pip install docker-compose

# Use docker-compose instead of docker compose
docker-compose up -d
```

### Option B: Switch Docker Backend
In Docker Desktop Settings:
- Try switching between WSL2 and Hyper-V backend
- Restart after switching

### Option C: Update Docker Desktop
- Download latest version from docker.com
- Install over existing installation

## Current Error
```
request returned 500 Internal Server Error for API route and version 
http://%2F%2F.%2Fpipe%2FdockerDesktopLinuxEngine/v1.48/...
```

This means Docker Desktop's internal API is broken and needs reset/reinstall.
