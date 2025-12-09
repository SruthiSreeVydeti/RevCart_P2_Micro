@echo off
echo Updating Dockerfiles...

powershell -Command "(Get-Content 'backend-services\user-service\Dockerfile') -replace 'FROM openjdk:17-jre-slim', 'FROM eclipse-temurin:17-jre-alpine' | Set-Content 'backend-services\user-service\Dockerfile'"
powershell -Command "(Get-Content 'backend-services\product-service\Dockerfile') -replace 'FROM openjdk:17-jre-slim', 'FROM eclipse-temurin:17-jre-alpine' | Set-Content 'backend-services\product-service\Dockerfile'"
powershell -Command "(Get-Content 'backend-services\cart-service\Dockerfile') -replace 'FROM openjdk:17-jre-slim', 'FROM eclipse-temurin:17-jre-alpine' | Set-Content 'backend-services\cart-service\Dockerfile'"
powershell -Command "(Get-Content 'backend-services\order-service\Dockerfile') -replace 'FROM openjdk:17-jre-slim', 'FROM eclipse-temurin:17-jre-alpine' | Set-Content 'backend-services\order-service\Dockerfile'"
powershell -Command "(Get-Content 'backend-services\payment-service\Dockerfile') -replace 'FROM openjdk:17-jre-slim', 'FROM eclipse-temurin:17-jre-alpine' | Set-Content 'backend-services\payment-service\Dockerfile'"
powershell -Command "(Get-Content 'backend-services\delivery-service\Dockerfile') -replace 'FROM openjdk:17-jre-slim', 'FROM eclipse-temurin:17-jre-alpine' | Set-Content 'backend-services\delivery-service\Dockerfile'"
powershell -Command "(Get-Content 'backend-services\notification-service\Dockerfile') -replace 'FROM openjdk:17-jre-slim', 'FROM eclipse-temurin:17-jre-alpine' | Set-Content 'backend-services\notification-service\Dockerfile'"
powershell -Command "(Get-Content 'backend-services\analytics-service\Dockerfile') -replace 'FROM openjdk:17-jre-slim', 'FROM eclipse-temurin:17-jre-alpine' | Set-Content 'backend-services\analytics-service\Dockerfile'"
powershell -Command "(Get-Content 'backend-services\api-gateway\Dockerfile') -replace 'FROM openjdk:17-jre-slim', 'FROM eclipse-temurin:17-jre-alpine' | Set-Content 'backend-services\api-gateway\Dockerfile'"

echo All Dockerfiles updated!
