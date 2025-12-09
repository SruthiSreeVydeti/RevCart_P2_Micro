# RevCart Microservices Frontend Setup

## Option 1: Use Existing Frontend (Recommended)

Your existing frontend at `d:\revcart_p1\frontend` can work with microservices by updating API endpoints.

### Update API Configuration

Create `d:\revcart_p1\frontend\src\environments\environment.microservices.ts`:

```typescript
export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080/api', // API Gateway
  services: {
    user: 'http://localhost:8081/api',
    product: 'http://localhost:8082/api',
    cart: 'http://localhost:8083/api',
    order: 'http://localhost:8084/api',
    payment: 'http://localhost:8085/api',
    delivery: 'http://localhost:8086/api',
    notification: 'http://localhost:8087/api',
    analytics: 'http://localhost:8088/api'
  }
};
```

## Option 2: Copy Frontend to Microservices Folder

```bash
xcopy /E /I d:\revcart_p1\frontend d:\RevCart-Microservices\frontend
```

Then update the environment files to point to microservices.

## Option 3: Create API Gateway (Recommended for Production)

Instead of frontend calling each service directly, use API Gateway on port 8080 to route all requests.

### API Gateway Routes:
- `/api/auth/**` → User Service (8081)
- `/api/users/**` → User Service (8081)
- `/api/products/**` → Product Service (8082)
- `/api/cart/**` → Cart Service (8083)
- `/api/orders/**` → Order Service (8084)
- `/api/payments/**` → Payment Service (8085)
- `/api/delivery/**` → Delivery Service (8086)
- `/api/notifications/**` → Notification Service (8087)
- `/api/analytics/**` → Analytics Service (8088)

## Quick Implementation

I'll create:
1. API Gateway service
2. Updated environment configuration
3. Docker setup for frontend

Choose your approach and I'll implement it!
