# RevCart Micro Frontend Architecture

## Overview
RevCart uses Module Federation to create independent micro frontends for each feature.

## Micro Frontend Services

| MFE | Port | Responsibility |
|-----|------|----------------|
| **Shell App** | 4200 | Main container, routing, navigation |
| **Auth MFE** | 4201 | Login, signup, authentication |
| **Product MFE** | 4202 | Product catalog, search, filters |
| **Cart MFE** | 4203 | Shopping cart management |
| **Orders MFE** | 4204 | Order placement, history |
| **Profile MFE** | 4205 | User profile, address management |
| **Delivery MFE** | 4206 | Delivery tracking, agent info |
| **Notifications MFE** | 4207 | Real-time notifications |

## Architecture Benefits

✅ **Independent Deployment** - Each MFE can be deployed separately
✅ **Team Autonomy** - Different teams can work on different MFEs
✅ **Technology Flexibility** - Each MFE can use different Angular versions
✅ **Faster Builds** - Only changed MFEs need to be rebuilt
✅ **Better Performance** - Lazy loading of micro frontends

## Setup Instructions

### 1. Install All Dependencies
```bash
setup-all-mfe.bat
```

### 2. Start All Micro Frontends
```bash
start-all-mfe.bat
```

### 3. Access the Application
Open browser: http://localhost:4200

## Current Status

✅ **Completed MFEs:**
- Shell App (Container)
- Auth MFE (Authentication)
- Product MFE (Product Catalog)
- Cart MFE (Shopping Cart)

⚙️ **To Be Completed:**
- Orders MFE
- Profile MFE
- Delivery MFE
- Notifications MFE

## API Integration

All MFEs connect to backend services through API Gateway:
- **API Gateway URL**: http://localhost:8090

### Service Endpoints:
- User Service: `/api/users/*`
- Product Service: `/api/products/*`
- Cart Service: `/api/cart/*`
- Order Service: `/api/orders/*`
- Payment Service: `/api/payments/*`
- Delivery Service: `/api/delivery/*`
- Notification Service: `/api/notifications/*`

## Development

### Run Individual MFE
```bash
cd frontend-services/cart-mfe
npm start
```

### Build for Production
```bash
cd frontend-services/cart-mfe
npm run build
```

## Module Federation Configuration

Each MFE exposes its module through webpack Module Federation:
- **Shell App** - Consumes all MFEs
- **Each MFE** - Exposes its main module

## Next Steps

1. Complete remaining MFEs (Orders, Profile, Delivery, Notifications)
2. Implement authentication flow
3. Add state management (NgRx)
4. Implement WebSocket for real-time notifications
5. Add error handling and loading states
6. Create Docker containers for each MFE
7. Set up CI/CD pipelines
