# RevCart - Quick Setup Instructions

## Prerequisites (Must Have)

1. **Java 17** - Download from: https://www.oracle.com/java/technologies/downloads/#java17
2. **Maven** - Download from: https://maven.apache.org/download.cgi
3. **Node.js 18+** - Download from: https://nodejs.org/
4. **Docker Desktop** - Download from: https://www.docker.com/products/docker-desktop/

## Verify Prerequisites

Open Command Prompt and run:
```bash
java -version        # Should show Java 17
mvn -version         # Should show Maven
node -version        # Should show Node 18+
npm -version         # Should show npm
docker --version     # Should show Docker
```

## Quick Start (3 Simple Steps)

### Step 1: Stop Any Running Services
```bash
STOP_ALL.bat
```

### Step 2: Start Everything
```bash
START_PROJECT_NOW.bat
```

### Step 3: Wait & Access
- Wait 3-4 minutes for all services to start
- Open browser: **http://localhost:4200**

## Check Status
```bash
CHECK_STATUS.bat
```

## Access Points

| Service | URL |
|---------|-----|
| **Frontend UI** | http://localhost:4200 |
| **API Gateway** | http://localhost:8090 |
| **Consul Dashboard** | http://localhost:8500 |
| User Service | http://localhost:8081 |
| Product Service | http://localhost:8082 |
| Cart Service | http://localhost:8083 |
| Order Service | http://localhost:8084 |
| Payment Service | http://localhost:8085 |
| Delivery Service | http://localhost:8086 |
| Notification Service | http://localhost:8087 |
| Analytics Service | http://localhost:8088 |

## Test API

Open browser or Postman:
```
GET http://localhost:8090/api/products
```

## Common Issues & Fixes

### Issue 1: Port Already in Use
**Solution:** Run `STOP_ALL.bat` first

### Issue 2: Docker Not Running
**Solution:** Start Docker Desktop application

### Issue 3: Build Fails
**Solution:** 
```bash
mvn clean install -DskipTests -U
```

### Issue 4: Frontend Won't Start
**Solution:**
```bash
cd frontend-services\shell-app
rmdir /s /q node_modules
npm install
npm start
```

### Issue 5: Database Connection Error
**Solution:** Wait 30 seconds for databases to fully start

## Project Structure

```
RevCart-Microservices/
├── backend-services/          # 9 Microservices
│   ├── user-service/         # Port 8081
│   ├── product-service/      # Port 8082
│   ├── cart-service/         # Port 8083
│   ├── order-service/        # Port 8084
│   ├── payment-service/      # Port 8085
│   ├── delivery-service/     # Port 8086
│   ├── notification-service/ # Port 8087
│   ├── analytics-service/    # Port 8088
│   └── api-gateway/          # Port 8090
├── frontend-services/         # Microfrontends
│   ├── shell-app/            # Main container
│   ├── auth-mfe/
│   ├── product-mfe/
│   ├── cart-mfe/
│   ├── orders-mfe/
│   ├── profile-mfe/
│   ├── delivery-mfe/
│   └── notifications-mfe/
└── infrastructure/
    ├── consul/               # Service Discovery
    └── databases/            # MySQL, MongoDB, Redis
```

## What Gets Started

1. **Consul** - Service discovery on port 8500
2. **5 MySQL Databases** - Ports 3307-3311
3. **MongoDB** - Port 27018
4. **Redis** - Port 6379
5. **9 Microservices** - Ports 8081-8088, 8090
6. **Frontend** - Port 4200

## Next Steps for AWS Deployment

1. Ensure project runs locally first
2. Create AWS account
3. Install AWS CLI
4. Configure Docker images
5. Set up ECS/EKS clusters
6. Deploy services

## Need Help?

- Check logs in the command windows that open
- Run `CHECK_STATUS.bat` to see what's running
- Check Consul dashboard: http://localhost:8500
- Verify databases are running: `docker ps`

## Important Notes

- First startup takes 5-10 minutes (downloading dependencies)
- Subsequent startups take 2-3 minutes
- Keep all command windows open (they show service logs)
- Don't close Docker Desktop while running
- Each service has its own database (microservices pattern)
