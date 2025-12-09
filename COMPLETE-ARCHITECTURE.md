# RevCart Complete Microservices + Micro Frontend Architecture

## 🏗️ Architecture Overview

### Backend Microservices (Port 8080-8088)
```
API Gateway (8080)
├── User Service (8081) - MySQL
├── Product Service (8082) - MySQL
├── Cart Service (8083) - MySQL
├── Order Service (8084) - MySQL
├── Payment Service (8085) - MySQL
├── Delivery Service (8086) - MySQL
├── Notification Service (8087) - MongoDB
└── Analytics Service (8088) - MongoDB
```

### Frontend Micro Frontends (Port 4200-4207)
```
Shell App (4200)
├── Auth MFE (4201)
├── Product MFE (4202)
├── Cart MFE (4203)
├── Orders MFE (4204)
├── Profile MFE (4205)
├── Delivery MFE (4206)
└── Notifications MFE (4207)
```

### Infrastructure Services
- **Consul** (8500) - Service Registry & Discovery
- **Config Server** (8888) - Centralized Configuration
- **MySQL Databases** (3307-3309) - Relational Data
- **MongoDB** (27018) - Document Data

## 🚀 Complete Setup Guide

### Step 1: Start Infrastructure
```bash
cd D:\RevCart-Microservices\scripts
start-infrastructure.bat
```

### Step 2: Build Backend Services
```bash
build-all.bat
```

### Step 3: Start Backend Services
```bash
cd D:\RevCart-Microservices
docker-compose up -d
```

### Step 4: Install Frontend Dependencies
```bash
cd scripts
install-all-mfe.bat
```

### Step 5: Start All Micro Frontends
```bash
start-all-mfe.bat
```

## 📊 Service Communication

### Backend Communication
- **OpenFeign** - Synchronous REST calls between services
- **Circuit Breaker** - Resilience4j for fault tolerance
- **Load Balancing** - Spring Cloud LoadBalancer
- **Service Discovery** - Consul

### Frontend Communication
- **Module Federation** - Dynamic loading of micro frontends
- **Shared State** - localStorage + Custom Events
- **API Gateway** - Single entry point for all API calls

## 🔐 Security

### Backend
- JWT authentication in User Service
- API Gateway handles routing and security
- Each service validates requests

### Frontend
- Auth guards in shell app
- Token stored in localStorage
- Interceptors for adding auth headers

## 📈 Monitoring & Health Checks

### Backend
- Actuator endpoints: `/actuator/health`
- Consul UI: http://localhost:8500
- Service health checks every 10s

### Frontend
- Each MFE runs independently
- Browser DevTools for debugging
- Network tab shows Module Federation loading

## 🎯 Key Features Implemented

### Backend
✅ Service Registry (Consul)
✅ API Gateway with Load Balancing
✅ Circuit Breaker Pattern
✅ OpenFeign for Inter-service Communication
✅ Config Server for Centralized Configuration
✅ Database Per Service Pattern
✅ Docker Containerization
✅ Health Checks & Monitoring

### Frontend
✅ Module Federation
✅ Lazy Loading of MFEs
✅ Shared Dependencies
✅ Independent Deployment
✅ Integrated Routing
✅ API Gateway Integration
✅ Responsive Design (Bootstrap 5)

## 🔄 Data Flow Example: User Login

1. **User enters credentials** in Auth MFE (4201)
2. **Auth MFE calls** API Gateway (8080)
3. **API Gateway routes** to User Service (8081)
4. **User Service validates** credentials
5. **User Service calls** Notification Service via Feign
6. **Notification Service sends** welcome email
7. **Response flows back** through Gateway to Auth MFE
8. **Auth MFE stores** token and redirects to Products

## 🔄 Data Flow Example: Product Purchase

1. **User browses** products in Product MFE (4202)
2. **Product MFE fetches** data from Product Service (8082)
3. **User adds to cart** in Cart MFE (4203)
4. **Cart Service stores** cart data
5. **User checks out** in Orders MFE (4204)
6. **Order Service creates** order
7. **Order Service calls** Payment Service via Feign
8. **Payment Service processes** payment
9. **Order Service calls** Delivery Service
10. **Delivery Service assigns** delivery agent
11. **Notification Service sends** order confirmation

## 📦 Deployment Strategy

### Backend
- Each service has its own Dockerfile
- Docker Compose for local development
- Kubernetes for production (recommended)
- Separate databases per service

### Frontend
- Each MFE deployed independently
- CDN for static assets
- Nginx for routing
- Environment-specific configurations

## 🛠️ Development Workflow

### Adding New Backend Service
1. Create service directory in `backend-services/`
2. Add pom.xml with dependencies
3. Configure Consul discovery
4. Add Feign clients for communication
5. Update API Gateway routes
6. Add to docker-compose.yml

### Adding New Frontend MFE
1. Create directory in `frontend-services/`
2. Add package.json with unique port
3. Configure webpack with Module Federation
4. Create and expose module
5. Register in shell app remotes
6. Add route in shell app

## 📝 API Endpoints (via Gateway)

### Authentication
- POST /api/auth/signup
- POST /api/auth/signin
- POST /api/auth/verify-email

### Products
- GET /api/products
- GET /api/products/{id}
- POST /api/products (admin)
- GET /api/search?q={query}

### Cart
- GET /api/cart
- POST /api/cart/add
- DELETE /api/cart/{itemId}

### Orders
- POST /api/orders
- GET /api/orders
- GET /api/orders/{id}

### Payments
- POST /api/payments/process
- POST /api/razorpay/create-order

### Delivery
- GET /api/delivery/track/{orderId}
- PUT /api/delivery/update-status

### Notifications
- GET /api/notifications
- POST /api/notifications/send

### Analytics
- GET /api/analytics/dashboard
- GET /api/analytics/sales

## 🎓 Technology Stack

### Backend
- Java 17
- Spring Boot 3.3.5
- Spring Cloud 2023.0.3
- MySQL 8.0
- MongoDB 6.0
- Consul 1.15
- Docker

### Frontend
- Angular 18.2.0
- TypeScript 5.4.0
- Module Federation
- Bootstrap 5.3.0
- RxJS 7.8.0

## 🔍 Troubleshooting

### Backend Issues
- Check Consul UI for service registration
- Verify database connections
- Check Actuator health endpoints
- Review circuit breaker status

### Frontend Issues
- Verify all MFEs are running
- Check browser console for errors
- Inspect Network tab for remoteEntry.js
- Verify API Gateway is accessible

## 📚 Documentation
- Backend: `README.md`
- Frontend: `MICROFRONTEND-README.md`
- This file: Complete architecture overview

## 🎉 Success Criteria
✅ All backend services registered in Consul
✅ API Gateway routing to all services
✅ Circuit breakers functioning
✅ All MFEs loading in shell app
✅ End-to-end user flows working
✅ Health checks passing
✅ Inter-service communication working

## 🚀 Next Steps
1. Add authentication guards to MFEs
2. Implement shared state management
3. Add E2E tests
4. Setup CI/CD pipelines
5. Add monitoring (Prometheus/Grafana)
6. Implement distributed tracing (Zipkin)
7. Add API documentation (Swagger)
8. Performance optimization
9. Security hardening
10. Production deployment