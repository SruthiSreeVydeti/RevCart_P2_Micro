# Setup Local Databases for RevCart

## 1. MySQL (Required)
Already running on port 3306 ✅

## 2. MongoDB Setup

### Option A: MongoDB Community Server
1. Download: https://www.mongodb.com/try/download/community
2. Install MongoDB Community Server
3. Start MongoDB service:
   ```
   net start MongoDB
   ```
4. Verify: http://localhost:27017 (should show "It looks like you are trying to access MongoDB over HTTP")

### Option B: MongoDB with Chocolatey
```powershell
choco install mongodb
mongod --dbpath C:\data\db
```

### Option C: MongoDB Portable
1. Download ZIP from MongoDB website
2. Extract to C:\mongodb
3. Create data directory: `mkdir C:\data\db`
4. Run: `C:\mongodb\bin\mongod.exe --dbpath C:\data\db`

## 3. Redis Setup

### Option A: Redis for Windows (Recommended)
1. Download: https://github.com/microsoftarchive/redis/releases
2. Download Redis-x64-3.0.504.msi
3. Install and start Redis service
4. Verify: `redis-cli ping` (should return PONG)

### Option B: Redis with Chocolatey
```powershell
choco install redis-64
redis-server
```

### Option C: Redis Portable
1. Download from: https://github.com/tporadowski/redis/releases
2. Extract and run: `redis-server.exe`

## 4. Verify All Services

Run: `CHECK_LOCAL_STATUS.bat`

Should show:
- [OK] MySQL (3306)
- [OK] MongoDB (27017)  
- [OK] Redis (6379)

## 5. Create Databases

### MySQL Databases (Auto-created by services)
- user_service_db
- product_service_db  
- cart_service_db
- order_service_db
- payment_service_db
- delivery_service_db

### MongoDB Databases (Auto-created)
- notification_service_db
- analytics_service_db

## Quick Test Commands

```bash
# Test MySQL
mysql -u root -p -e "SHOW DATABASES;"

# Test MongoDB
mongo --eval "db.runCommand({connectionStatus : 1})"

# Test Redis
redis-cli ping
```