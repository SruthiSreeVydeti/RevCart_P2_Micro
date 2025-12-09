# Running RevCart Microservices

## Prerequisites

Before starting the services, ensure you have:

1. ✅ **Docker Desktop** - Running
2. ✅ **MySQL** - Running on port 3307 (username: root, password: root)
3. ✅ **MongoDB** - Running on 127.0.0.1:27017
4. ✅ **Redis** - Running on port 6379 (for cart-service)
5. ✅ **Java 17** - Installed
6. ✅ **Maven** - Installed

## Quick Start

### Option 1: Automated Startup (Recommended)

```bash
# Start all services automatically
start-all-services.bat
```

This will:
1. Start Consul (service discovery)
2. Start Config Server (port 8888)
3. Start API Gateway (port 8080)
4. Start all 8 microservices

### Option 2: Manual Startup

#### Step 1: Start Consul
```bash
cd infrastructure\consul
docker-compose up -d
```

#### Step 2: Start Config Server
```bash
cd infrastructure\config-server
mvn spring-boot:run
```
Wait 30 seconds for Config Server to be ready.

#### Step 3: Start API Gateway
```bash
cd backend-services\api-gateway
mvn spring-boot:run
```
Wait 20 seconds for API Gateway to be ready.

#### Step 4: Start Microservices

Open separate terminals for each service:

```bash
# User Service (Port 8081)
cd backend-services\user-service
mvn spring-boot:run

# Product Service (Port 8082)
cd backend-services\product-service
mvn spring-boot:run

# Cart Service (Port 8083)
cd backend-services\cart-service
mvn spring-boot:run

# Order Service (Port 8084)
cd backend-services\order-service
mvn spring-boot:run

# Payment Service (Port 8085)
cd backend-services\payment-service
mvn spring-boot:run

# Delivery Service (Port 8086)
cd backend-services\delivery-service
mvn spring-boot:run

# Notification Service (Port 8087)
cd backend-services\notification-service
mvn spring-boot:run

# Analytics Service (Port 8088)
cd backend-services\analytics-service
mvn spring-boot:run
```

## Verify Services

### Check Service Health
```bash
check-services.bat
```

### Check Consul Registration

1. Open browser: http://localhost:8500
2. Click on "Services" in the left menu
3. You should see all services registered:
   - config-server
   - api-gateway
   - user-service
   - product-service
   - cart-service
   - order-service
   - payment-service
   - delivery-service
   - notification-service
   - analytics-service

### Manual Health Checks

```bash
# Config Server
curl http://localhost:8888/actuator/health

# API Gateway
curl http://localhost:8080/actuator/health

# User Service
curl http://localhost:8081/actuator/health

# Product Service
curl http://localhost:8082/actuator/health

# Cart Service
curl http://localhost:8083/actuator/health

# Order Service
curl http://localhost:8084/actuator/health

# Payment Service
curl http://localhost:8085/actuator/health

# Delivery Service
curl http://localhost:8086/actuator/health

# Notification Service
curl http://localhost:8087/actuator/health

# Analytics Service
curl http://localhost:8088/actuator/health
```

## Stop Services

```bash
stop-all-services.bat
```

## Troubleshooting

### Service Not Starting

1. **Check logs** in the terminal window
2. **Verify database** connections (MySQL on 3307, MongoDB on 27017)
3. **Check port availability** - ensure no other service is using the ports
4. **Verify Consul** is running: http://localhost:8500

### Service Not Registering with Consul

1. **Check Consul** is running: `docker ps | findstr consul`
2. **Verify network** connectivity to Consul
3. **Check service logs** for Consul connection errors
4. **Restart the service** after Consul is fully ready

### Database Connection Issues

**MySQL:**
```bash
# Test connection
mysql -h localhost -P 3307 -u root -p
# Password: root
```

**MongoDB:**
```bash
# Test connection
mongosh mongodb://127.0.0.1:27017
```

### Port Already in Use

```bash
# Find process using port (example: 8081)
netstat -ano | findstr :8081

# Kill process by PID
taskkill /PID <PID> /F
```

## Service Startup Order

**Important:** Services should start in this order:

1. **Consul** (Service Discovery)
2. **Config Server** (Configuration Management)
3. **API Gateway** (Routing)
4. **Microservices** (Can start in any order)

## Expected Startup Time

- Consul: ~5 seconds
- Config Server: ~30 seconds
- API Gateway: ~20 seconds
- Each Microservice: ~30-60 seconds

**Total Time:** ~3-5 minutes for all services to be fully operational

## Access Points

| Service | URL | Purpose |
|---------|-----|---------|
| Consul UI | http://localhost:8500 | Service Discovery Dashboard |
| Config Server | http://localhost:8888 | Configuration Server |
| API Gateway | http://localhost:8080 | Main Entry Point |
| User Service | http://localhost:8081 | Direct Access (Dev Only) |
| Product Service | http://localhost:8082 | Direct Access (Dev Only) |
| Cart Service | http://localhost:8083 | Direct Access (Dev Only) |
| Order Service | http://localhost:8084 | Direct Access (Dev Only) |
| Payment Service | http://localhost:8085 | Direct Access (Dev Only) |
| Delivery Service | http://localhost:8086 | Direct Access (Dev Only) |
| Notification Service | http://localhost:8087 | Direct Access (Dev Only) |
| Analytics Service | http://localhost:8088 | Direct Access (Dev Only) |

## Testing APIs

All APIs should be accessed through the API Gateway:

```bash
# Example: User Registration
curl -X POST http://localhost:8080/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password123",
    "firstName": "John",
    "lastName": "Doe",
    "phone": "1234567890"
  }'

# Example: Get Products
curl http://localhost:8080/api/products
```

## Success Indicators

✅ All services show "UP" status in Consul UI
✅ Health endpoints return `{"status":"UP"}`
✅ No error logs in service terminals
✅ API Gateway can route requests to all services
✅ Databases are connected and accessible

## Next Steps

Once all services are running:
1. Test API endpoints through Postman or curl
2. Monitor service health in Consul UI
3. Check service logs for any warnings
4. Test inter-service communication
5. Verify database connections and data persistence
