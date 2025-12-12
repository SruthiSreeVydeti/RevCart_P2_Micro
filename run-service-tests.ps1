Write-Host "Running service layer tests for all microservices..." -ForegroundColor Green

Write-Host "Testing User Service..." -ForegroundColor Yellow
Set-Location "backend-services\user-service"
mvn test -Dtest=*ServiceTest
Set-Location "..\..\"

Write-Host "Testing Product Service..." -ForegroundColor Yellow
Set-Location "backend-services\product-service"
mvn test -Dtest=*ServiceTest
Set-Location "..\..\"

Write-Host "Testing Cart Service..." -ForegroundColor Yellow
Set-Location "backend-services\cart-service"
mvn test -Dtest=*ServiceTest
Set-Location "..\..\"

Write-Host "Testing Order Service..." -ForegroundColor Yellow
Set-Location "backend-services\order-service"
mvn test -Dtest=*ServiceTest
Set-Location "..\..\"

Write-Host "Testing Payment Service..." -ForegroundColor Yellow
Set-Location "backend-services\payment-service"
mvn test -Dtest=*ServiceTest
Set-Location "..\..\"

Write-Host "Testing Delivery Service..." -ForegroundColor Yellow
Set-Location "backend-services\delivery-service"
mvn test -Dtest=*ServiceTest
Set-Location "..\..\"

Write-Host "All service tests completed!" -ForegroundColor Green