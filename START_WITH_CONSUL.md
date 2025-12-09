# Start All Services with Consul Registration

## Prerequisites
- Docker Desktop running
- Java 17 installed
- Maven installed

## Step-by-Step Startup

### 1. Start Consul
```bash
cd infrastructure\consul
docker-compose up -d
```
Wait 10 seconds for Consul to be ready.

### 2. Verify Consul is Running
Open browser: http://localhost:8500

### 3. Start Config Server
```bash
cd infrastructure\config-server
mvn clean install
mvn spring-boot:run
```
Wait until you see "Started ConfigServerApplication"

### 4. Start API Gateway
```bash
cd backend-services\api-gateway
mvn clean install
mvn spring-boot:run
```
Wait until you see "Started ApiGatewayApplication"

### 5. Start All Microservices
Open separate terminals for each:

```bash
# User Service
cd backend-services\user-service
mvn spring-boot:run

# Product Service
cd backend-services\product-service
mvn spring-boot:run

# Cart Service
cd backend-services\cart-service
mvn spring-boot:run

# Order Service
cd backend-services\order-service
mvn spring-boot:run

# Payment Service
cd backend-services\payment-service
mvn spring-boot:run

# Delivery Service
cd backend-services\delivery-service
mvn spring-boot:run

# Notification Service
cd backend-services\notification-service
mvn spring-boot:run

# Analytics Service
cd backend-services\analytics-service
mvn spring-boot:run
```

### 6. Verify All Services in Consul
Run the verification script:
```bash
check-consul-services.bat
```

Or open Consul UI: http://localhost:8500/ui/dc1/services

## Expected Services in Consul
✅ config-server (Port 8888)
✅ api-gateway (Port 8080)
✅ user-service (Port 8081)
✅ product-service (Port 8082)
✅ cart-service (Port 8083)
✅ order-service (Port 8084)
✅ payment-service (Port 8085)
✅ delivery-service (Port 8086)
✅ notification-service (Port 8087)
✅ analytics-service (Port 8088)

## Quick Test
```bash
# Test API Gateway
curl http://localhost:8080/actuator/health

# Test Config Server
curl http://localhost:8888/actuator/health

# Test via Gateway routing
curl http://localhost:8080/api/products
```

## Troubleshooting

### Service not appearing in Consul?
1. Check service logs for connection errors
2. Verify Consul is running: `docker ps`
3. Check application.properties has correct Consul host/port
4. Ensure actuator dependency is present for health checks

### Health check failing?
1. Verify `/actuator/health` endpoint is accessible
2. Check `management.endpoints.web.exposure.include` includes health
3. Ensure service is fully started before health check runs
