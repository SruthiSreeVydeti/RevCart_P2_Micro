# RevCart Micro Frontend Architecture

## Overview
Complete micro frontend implementation using **Module Federation** with Angular 18.

## Architecture

### Shell Application (Port 4200)
- Main container application
- Handles routing and navigation
- Loads remote micro frontends dynamically

### Micro Frontends

| MFE | Port | Responsibility |
|-----|------|----------------|
| **auth-mfe** | 4201 | Login, Register, Authentication |
| **product-mfe** | 4202 | Product catalog, search, details |
| **cart-mfe** | 4203 | Shopping cart, wishlist |
| **orders-mfe** | 4204 | Order history, tracking |
| **profile-mfe** | 4205 | User profile, settings |
| **delivery-mfe** | 4206 | Delivery tracking |
| **notifications-mfe** | 4207 | Notifications center |

## Technology Stack
- **Angular 18.2.0**
- **Module Federation** via @angular-architects/module-federation
- **Bootstrap 5.3.0**
- **RxJS 7.8.0**

## Setup Instructions

### 1. Install Dependencies for Each MFE

```bash
# Shell App
cd frontend-services/shell-app
npm install

# Auth MFE
cd ../auth-mfe
npm install

# Product MFE
cd ../product-mfe
npm install

# Repeat for other MFEs...
```

### 2. Start All Micro Frontends

```bash
# Terminal 1 - Shell App
cd shell-app
npm start

# Terminal 2 - Auth MFE
cd auth-mfe
npm start

# Terminal 3 - Product MFE
cd product-mfe
npm start

# Continue for other MFEs...
```

### 3. Access Application
- **Shell App**: http://localhost:4200
- All micro frontends are loaded dynamically through the shell

## Module Federation Configuration

### Shell App (webpack.config.js)
```javascript
remotes: {
  "authMfe": "http://localhost:4201/remoteEntry.js",
  "productMfe": "http://localhost:4202/remoteEntry.js",
  "cartMfe": "http://localhost:4203/remoteEntry.js",
  // ... other remotes
}
```

### Each MFE (webpack.config.js)
```javascript
exposes: {
  './Module': './src/app/[mfe-name].module.ts'
}
```

## Features Implemented

✅ **Module Federation**: Dynamic loading of micro frontends
✅ **Lazy Loading**: MFEs loaded on-demand
✅ **Shared Dependencies**: Angular core, common, router shared across MFEs
✅ **Independent Deployment**: Each MFE can be deployed separately
✅ **Routing**: Integrated routing across all MFEs
✅ **API Integration**: All MFEs connect to API Gateway (port 8080)

## API Gateway Integration
All micro frontends communicate with backend through API Gateway:
- **Base URL**: http://localhost:8080
- **Auth**: /api/auth/*
- **Products**: /api/products/*
- **Cart**: /api/cart/*
- **Orders**: /api/orders/*

## Development Workflow

### Adding New MFE
1. Create new directory in `frontend-services/`
2. Add package.json with unique port
3. Configure webpack.config.js with Module Federation
4. Create module and expose it
5. Register in shell app's webpack.config.js remotes
6. Add route in shell app's app.routes.ts

### Building for Production
```bash
# Build all MFEs
cd shell-app && npm run build
cd ../auth-mfe && npm run build
cd ../product-mfe && npm run build
# ... continue for all MFEs
```

## Deployment Strategy

### Option 1: Separate Hosting
- Deploy each MFE to separate subdomain
- Update webpack.config.js remotes with production URLs

### Option 2: Single Server
- Build all MFEs
- Serve from different paths on same server
- Use nginx for routing

## Benefits

✅ **Independent Development**: Teams can work on different MFEs
✅ **Independent Deployment**: Deploy MFEs without affecting others
✅ **Technology Flexibility**: Can use different versions/frameworks
✅ **Scalability**: Scale individual MFEs based on load
✅ **Faster Builds**: Build only changed MFEs
✅ **Team Autonomy**: Different teams own different MFEs

## Communication Between MFEs

### Shared State
- Use localStorage for simple state
- Implement event bus for cross-MFE communication
- Use shared services for complex state management

### Example: Cart Count
```typescript
// In cart-mfe
localStorage.setItem('cartCount', count.toString());
window.dispatchEvent(new Event('cartUpdated'));

// In shell-app
window.addEventListener('cartUpdated', () => {
  const count = localStorage.getItem('cartCount');
  // Update UI
});
```

## Monitoring & Debugging
- Each MFE runs independently in development
- Use browser DevTools to inspect loaded modules
- Check Network tab for remoteEntry.js files
- Module Federation Dashboard available for visualization

## Next Steps
1. Complete implementation of remaining MFEs (cart, orders, profile, delivery, notifications)
2. Add authentication guards
3. Implement shared state management
4. Add error boundaries
5. Setup CI/CD pipelines for each MFE
6. Add E2E tests
7. Performance optimization
8. Add monitoring and analytics