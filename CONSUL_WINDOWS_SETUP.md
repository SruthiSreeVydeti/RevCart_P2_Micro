# Run Consul Without Docker (Windows Native)

## Quick Setup

### 1. Download Consul
```
https://releases.hashicorp.com/consul/1.15.0/consul_1.15.0_windows_amd64.zip
```

### 2. Extract and Run
```bash
# Extract to any folder, e.g., C:\consul\
# Open PowerShell/CMD in that folder and run:
consul.exe agent -dev -ui -client=0.0.0.0
```

### 3. Verify
Open browser: http://localhost:8500

## Alternative: Use Embedded Consul (No Download Needed)

Since Docker is having issues, you can run your microservices WITHOUT Consul temporarily:

### Disable Consul in All Services

Add to each service's `application.properties`:
```properties
spring.cloud.consul.enabled=false
spring.cloud.discovery.enabled=false
```

### Services Will Still Work
- API Gateway will route to services using direct URLs
- Services can communicate via direct HTTP calls
- No service discovery, but everything functions

## Current Status

All your services are running on their ports:
- API Gateway: 8080
- Product Service: 8082
- Cart Service: 8083
- Order Service: 8084
- Payment Service: 8085
- Delivery Service: 8086
- Notification Service: 8087
- Analytics Service: 8088

They work independently even without Consul!

## Recommendation

1. Fix Docker Desktop (restart Windows if needed)
2. Or download Consul Windows binary
3. Or disable Consul and use direct service URLs
