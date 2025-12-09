@echo off
echo Cleaning up old Consul service registrations...

curl -X PUT http://localhost:8500/v1/agent/service/deregister/analytics-service-000b2b662e7bfc85d3b203a08107da74
curl -X PUT http://localhost:8500/v1/agent/service/deregister/analytics-service-ee10b659c7711c62a81567de1172d614
curl -X PUT http://localhost:8500/v1/agent/service/deregister/cart-service-e43040d99f0dc697a15c06001c3a6669
curl -X PUT http://localhost:8500/v1/agent/service/deregister/delivery-service-f5a0f8cbef47df641005174b73ab7b41
curl -X PUT http://localhost:8500/v1/agent/service/deregister/notification-service-03b407aa4c9a7ba6cc1aa81592c6c98c
curl -X PUT http://localhost:8500/v1/agent/service/deregister/notification-service-e186193a1778e4dedefafe931497e31c
curl -X PUT http://localhost:8500/v1/agent/service/deregister/order-service-b1f4326950950d305752530c1f35458f
curl -X PUT http://localhost:8500/v1/agent/service/deregister/payment-service-3eba7e9810b34271f6c2dac15bdf6939
curl -X PUT http://localhost:8500/v1/agent/service/deregister/product-service-6012a58fecc5cac64fa8c8873f7d2cd6

echo.
echo Cleanup complete! Check Consul UI: http://localhost:8500
