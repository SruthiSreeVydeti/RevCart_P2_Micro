@echo off
echo ========================================
echo RevCart Monolith to Microservices Migration
echo ========================================

set MONOLITH_PATH=d:\revcart_p1\backend\src\main\java\com\revcart
set MICRO_PATH=d:\RevCart-Microservices\backend-services

echo.
echo Migrating User Service...
xcopy "%MONOLITH_PATH%\controller\AuthController.java" "%MICRO_PATH%\user-service\src\main\java\com\revcart\user\controller\" /Y
xcopy "%MONOLITH_PATH%\controller\UserController.java" "%MICRO_PATH%\user-service\src\main\java\com\revcart\user\controller\" /Y
xcopy "%MONOLITH_PATH%\entity\User.java" "%MICRO_PATH%\user-service\src\main\java\com\revcart\user\entity\" /Y
xcopy "%MONOLITH_PATH%\entity\Address.java" "%MICRO_PATH%\user-service\src\main\java\com\revcart\user\entity\" /Y
xcopy "%MONOLITH_PATH%\repository\UserRepository.java" "%MICRO_PATH%\user-service\src\main\java\com\revcart\user\repository\" /Y
xcopy "%MONOLITH_PATH%\repository\AddressRepository.java" "%MICRO_PATH%\user-service\src\main\java\com\revcart\user\repository\" /Y
xcopy "%MONOLITH_PATH%\service\AuthenticationService.java" "%MICRO_PATH%\user-service\src\main\java\com\revcart\user\service\" /Y
xcopy "%MONOLITH_PATH%\config\JwtUtils.java" "%MICRO_PATH%\user-service\src\main\java\com\revcart\user\config\" /Y
xcopy "%MONOLITH_PATH%\config\SecurityConfig.java" "%MICRO_PATH%\user-service\src\main\java\com\revcart\user\config\" /Y
xcopy "%MONOLITH_PATH%\dto\LoginRequest.java" "%MICRO_PATH%\user-service\src\main\java\com\revcart\user\dto\" /Y
xcopy "%MONOLITH_PATH%\dto\SignupRequest.java" "%MICRO_PATH%\user-service\src\main\java\com\revcart\user\dto\" /Y

echo.
echo Migrating Product Service...
xcopy "%MONOLITH_PATH%\controller\ProductController.java" "%MICRO_PATH%\product-service\src\main\java\com\revcart\product\controller\" /Y
xcopy "%MONOLITH_PATH%\controller\SearchController.java" "%MICRO_PATH%\product-service\src\main\java\com\revcart\product\controller\" /Y
xcopy "%MONOLITH_PATH%\controller\RecommendationController.java" "%MICRO_PATH%\product-service\src\main\java\com\revcart\product\controller\" /Y
xcopy "%MONOLITH_PATH%\entity\Product.java" "%MICRO_PATH%\product-service\src\main\java\com\revcart\product\entity\" /Y
xcopy "%MONOLITH_PATH%\repository\ProductRepository.java" "%MICRO_PATH%\product-service\src\main\java\com\revcart\product\repository\" /Y
xcopy "%MONOLITH_PATH%\service\ProductService.java" "%MICRO_PATH%\product-service\src\main\java\com\revcart\product\service\" /Y
xcopy "%MONOLITH_PATH%\service\SearchService.java" "%MICRO_PATH%\product-service\src\main\java\com\revcart\product\service\" /Y
xcopy "%MONOLITH_PATH%\service\RecommendationService.java" "%MICRO_PATH%\product-service\src\main\java\com\revcart\product\service\" /Y

echo.
echo Migrating Cart Service...
xcopy "%MONOLITH_PATH%\controller\CartController.java" "%MICRO_PATH%\cart-service\src\main\java\com\revcart\cart\controller\" /Y
xcopy "%MONOLITH_PATH%\controller\WishlistController.java" "%MICRO_PATH%\cart-service\src\main\java\com\revcart\cart\controller\" /Y
xcopy "%MONOLITH_PATH%\entity\Cart.java" "%MICRO_PATH%\cart-service\src\main\java\com\revcart\cart\entity\" /Y
xcopy "%MONOLITH_PATH%\entity\CartItem.java" "%MICRO_PATH%\cart-service\src\main\java\com\revcart\cart\entity\" /Y
xcopy "%MONOLITH_PATH%\entity\Wishlist.java" "%MICRO_PATH%\cart-service\src\main\java\com\revcart\cart\entity\" /Y
xcopy "%MONOLITH_PATH%\repository\CartRepository.java" "%MICRO_PATH%\cart-service\src\main\java\com\revcart\cart\repository\" /Y
xcopy "%MONOLITH_PATH%\repository\CartItemRepository.java" "%MICRO_PATH%\cart-service\src\main\java\com\revcart\cart\repository\" /Y
xcopy "%MONOLITH_PATH%\repository\WishlistRepository.java" "%MICRO_PATH%\cart-service\src\main\java\com\revcart\cart\repository\" /Y
xcopy "%MONOLITH_PATH%\service\CartService.java" "%MICRO_PATH%\cart-service\src\main\java\com\revcart\cart\service\" /Y

echo.
echo Migrating Order Service...
xcopy "%MONOLITH_PATH%\controller\OrderController.java" "%MICRO_PATH%\order-service\src\main\java\com\revcart\order\controller\" /Y
xcopy "%MONOLITH_PATH%\entity\Order.java" "%MICRO_PATH%\order-service\src\main\java\com\revcart\order\entity\" /Y
xcopy "%MONOLITH_PATH%\entity\OrderItem.java" "%MICRO_PATH%\order-service\src\main\java\com\revcart\order\entity\" /Y
xcopy "%MONOLITH_PATH%\repository\OrderRepository.java" "%MICRO_PATH%\order-service\src\main\java\com\revcart\order\repository\" /Y
xcopy "%MONOLITH_PATH%\repository\OrderItemRepository.java" "%MICRO_PATH%\order-service\src\main\java\com\revcart\order\repository\" /Y
xcopy "%MONOLITH_PATH%\service\OrderService.java" "%MICRO_PATH%\order-service\src\main\java\com\revcart\order\service\" /Y

echo.
echo Migrating Payment Service...
xcopy "%MONOLITH_PATH%\controller\PaymentController.java" "%MICRO_PATH%\payment-service\src\main\java\com\revcart\payment\controller\" /Y
xcopy "%MONOLITH_PATH%\controller\RazorpayController.java" "%MICRO_PATH%\payment-service\src\main\java\com\revcart\payment\controller\" /Y
xcopy "%MONOLITH_PATH%\entity\Payment.java" "%MICRO_PATH%\payment-service\src\main\java\com\revcart\payment\entity\" /Y
xcopy "%MONOLITH_PATH%\repository\PaymentRepository.java" "%MICRO_PATH%\payment-service\src\main\java\com\revcart\payment\repository\" /Y
xcopy "%MONOLITH_PATH%\service\PaymentService.java" "%MICRO_PATH%\payment-service\src\main\java\com\revcart\payment\service\" /Y
xcopy "%MONOLITH_PATH%\service\RazorpayService.java" "%MICRO_PATH%\payment-service\src\main\java\com\revcart\payment\service\" /Y

echo.
echo Migrating Delivery Service...
xcopy "%MONOLITH_PATH%\controller\DeliveryController.java" "%MICRO_PATH%\delivery-service\src\main\java\com\revcart\delivery\controller\" /Y
xcopy "%MONOLITH_PATH%\entity\DeliveryAgent.java" "%MICRO_PATH%\delivery-service\src\main\java\com\revcart\delivery\entity\" /Y
xcopy "%MONOLITH_PATH%\repository\DeliveryAgentRepository.java" "%MICRO_PATH%\delivery-service\src\main\java\com\revcart\delivery\repository\" /Y
xcopy "%MONOLITH_PATH%\service\DeliveryService.java" "%MICRO_PATH%\delivery-service\src\main\java\com\revcart\delivery\service\" /Y
xcopy "%MONOLITH_PATH%\service\DeliveryAnalyticsService.java" "%MICRO_PATH%\delivery-service\src\main\java\com\revcart\delivery\service\" /Y

echo.
echo Migrating Notification Service...
xcopy "%MONOLITH_PATH%\controller\NotificationController.java" "%MICRO_PATH%\notification-service\src\main\java\com\revcart\notification\controller\" /Y
xcopy "%MONOLITH_PATH%\document\Notification.java" "%MICRO_PATH%\notification-service\src\main\java\com\revcart\notification\entity\" /Y
xcopy "%MONOLITH_PATH%\mongo\NotificationRepository.java" "%MICRO_PATH%\notification-service\src\main\java\com\revcart\notification\repository\" /Y
xcopy "%MONOLITH_PATH%\service\NotificationService.java" "%MICRO_PATH%\notification-service\src\main\java\com\revcart\notification\service\" /Y
xcopy "%MONOLITH_PATH%\service\EmailService.java" "%MICRO_PATH%\notification-service\src\main\java\com\revcart\notification\service\" /Y

echo.
echo Migrating Analytics Service...
xcopy "%MONOLITH_PATH%\controller\AnalyticsController.java" "%MICRO_PATH%\analytics-service\src\main\java\com\revcart\analytics\controller\" /Y
xcopy "%MONOLITH_PATH%\document\OrderAnalytics.java" "%MICRO_PATH%\analytics-service\src\main\java\com\revcart\analytics\entity\" /Y
xcopy "%MONOLITH_PATH%\mongo\OrderAnalyticsRepository.java" "%MICRO_PATH%\analytics-service\src\main\java\com\revcart\analytics\repository\" /Y
xcopy "%MONOLITH_PATH%\service\AnalyticsService.java" "%MICRO_PATH%\analytics-service\src\main\java\com\revcart\analytics\service\" /Y
xcopy "%MONOLITH_PATH%\service\MongoAnalyticsService.java" "%MICRO_PATH%\analytics-service\src\main\java\com\revcart\analytics\service\" /Y

echo.
echo ========================================
echo Migration Complete!
echo ========================================
echo.
echo Next Steps:
echo 1. Update package names in each service
echo 2. Create application.properties for each service
echo 3. Add main application class for each service
echo 4. Build: mvn clean install
echo.
pause
