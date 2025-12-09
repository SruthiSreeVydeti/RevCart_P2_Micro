# RevCart Microservices - Complete Implementation Guide

## Quick Start

### 1. Build All Services
```bash
cd d:\RevCart-Microservices
mvn clean install -DskipTests
```

### 2. Start Infrastructure
```bash
cd infrastructure\consul
docker-compose up -d

cd ..\config-server
mvn spring-boot:run
```

### 3. Start All Microservices
```bash
# Terminal 1 - User Service
cd backend-services\user-service
mvn spring-boot:run

# Terminal 2 - Product Service
cd backend-services\product-service
mvn spring-boot:run

# Terminal 3 - Cart Service
cd backend-services\cart-service
mvn spring-boot:run

# Terminal 4 - Order Service
cd backend-services\order-service
mvn spring-boot:run

# Terminal 5 - Payment Service
cd backend-services\payment-service
mvn spring-boot:run

# Terminal 6 - Delivery Service
cd backend-services\delivery-service
mvn spring-boot:run

# Terminal 7 - Notification Service
cd backend-services\notification-service
mvn spring-boot:run

# Terminal 8 - API Gateway
cd backend-services\api-gateway
mvn spring-boot:run
```

### 4. Or Use Docker Compose
```bash
docker-compose up -d --build
```

## Service Ports
- Config Server: 8888
- Consul: 8500
- API Gateway: 8080
- User Service: 8081
- Product Service: 8082
- Cart Service: 8083
- Order Service: 8084
- Payment Service: 8085
- Delivery Service: 8086
- Notification Service: 8087

## Database Setup
Each service uses its own database:
- user_service_db (MySQL)
- product_service_db (MySQL)
- cart_service_db (MySQL)
- order_service_db (MySQL)
- payment_service_db (MySQL)
- delivery_service_db (MySQL)
- notification_service_db (MongoDB)

## API Gateway Routes
All requests go through: http://localhost:8080

- /api/auth/** → User Service
- /api/users/** → User Service
- /api/products/** → Product Service
- /api/cart/** → Cart Service
- /api/orders/** → Order Service
- /api/payments/** → Payment Service
- /api/delivery/** → Delivery Service
- /api/notifications/** → Notification Service

## Implementation Status
✅ Config Server
✅ Service Discovery (Consul)
✅ API Gateway
⏳ User Service (In Progress)
⏳ Product Service (In Progress)
⏳ Cart Service (In Progress)
⏳ Order Service (In Progress)
⏳ Payment Service (In Progress)
⏳ Delivery Service (In Progress)
⏳ Notification Service (In Progress)
