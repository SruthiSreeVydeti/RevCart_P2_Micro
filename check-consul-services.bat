@echo off
echo ========================================
echo Checking Consul Service Registration
echo ========================================
echo.

echo Fetching registered services from Consul...
curl -s http://localhost:8500/v1/catalog/services
echo.
echo.

echo ========================================
echo Service Details:
echo ========================================
echo.

echo API Gateway:
curl -s http://localhost:8500/v1/health/service/api-gateway | findstr "ServiceName"
echo.

echo Config Server:
curl -s http://localhost:8500/v1/health/service/config-server | findstr "ServiceName"
echo.

echo User Service:
curl -s http://localhost:8500/v1/health/service/user-service | findstr "ServiceName"
echo.

echo Product Service:
curl -s http://localhost:8500/v1/health/service/product-service | findstr "ServiceName"
echo.

echo Cart Service:
curl -s http://localhost:8500/v1/health/service/cart-service | findstr "ServiceName"
echo.

echo Order Service:
curl -s http://localhost:8500/v1/health/service/order-service | findstr "ServiceName"
echo.

echo Payment Service:
curl -s http://localhost:8500/v1/health/service/payment-service | findstr "ServiceName"
echo.

echo Delivery Service:
curl -s http://localhost:8500/v1/health/service/delivery-service | findstr "ServiceName"
echo.

echo Notification Service:
curl -s http://localhost:8500/v1/health/service/notification-service | findstr "ServiceName"
echo.

echo Analytics Service:
curl -s http://localhost:8500/v1/health/service/analytics-service | findstr "ServiceName"
echo.

echo ========================================
echo Open Consul UI: http://localhost:8500
echo ========================================
