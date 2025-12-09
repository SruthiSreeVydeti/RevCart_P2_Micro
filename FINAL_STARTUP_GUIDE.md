# 🚀 RevCart - FINAL STARTUP GUIDE

## ✅ Your System is Ready!

I've verified:
- ✅ Docker: v29.0.1 (Running)
- ✅ Java: 17.0.8 (Correct version)
- ✅ Maven: 3.9.11 (Installed)

## 🎯 START THE PROJECT NOW (3 Commands)

### 1️⃣ Open Command Prompt in project folder
```
cd d:\RevCart-Microservices
```

### 2️⃣ Run this ONE command
```
START_PROJECT_NOW.bat
```

### 3️⃣ Wait 3-4 minutes, then open browser
```
http://localhost:4200
```

## 📊 What Will Happen

The script will automatically:
1. Start Consul (Service Discovery)
2. Start 5 MySQL databases + MongoDB + Redis
3. Build all 9 microservices
4. Start all backend services
5. Install frontend dependencies
6. Start frontend application

You'll see multiple command windows open - **DON'T CLOSE THEM!** They show service logs.

## 🔍 Check If Everything is Running

Run this anytime:
```
CHECK_STATUS.bat
```

You should see [OK] for all services.

## 🌐 Access Your Application

| What | URL |
|------|-----|
| **Main Application** | http://localhost:4200 |
| **API Gateway** | http://localhost:8090 |
| **Consul Dashboard** | http://localhost:8500 |

## 🧪 Test Backend API

Open browser:
```
http://localhost:8090/api/products
```

Should return JSON data.

## 🛑 Stop Everything

When done:
```
STOP_ALL.bat
```

## ⚠️ If Something Goes Wrong

### Problem: Port already in use
```
STOP_ALL.bat
START_PROJECT_NOW.bat
```

### Problem: Build fails
```
mvn clean install -DskipTests -U
```

### Problem: Frontend won't start
```
cd frontend-services\shell-app
npm install
npm start
```

### Problem: Can't connect to database
Wait 30 more seconds - databases take time to initialize.

## 📝 Important Notes

1. **First time startup**: 5-10 minutes (downloads dependencies)
2. **Next time**: 2-3 minutes
3. **Keep Docker Desktop running**
4. **Don't close the command windows** - they show logs
5. **If stuck**: Run STOP_ALL.bat and start again

## 🎯 For AWS Deployment (After Testing Locally)

Once everything works locally:
1. All services are containerized (Dockerfiles ready)
2. Each service is independent
3. Ready for ECS/EKS deployment
4. We'll configure AWS after local testing

## 🆘 Quick Troubleshooting

| Issue | Solution |
|-------|----------|
| Docker error | Start Docker Desktop app |
| Port 8090 in use | Run STOP_ALL.bat first |
| Maven build fails | Run: mvn clean install -DskipTests |
| Frontend error | Delete node_modules, run npm install |
| Service won't start | Check logs in command window |

## 📂 Project Architecture

```
9 Microservices:
├── User Service (8081) - Authentication, profiles
├── Product Service (8082) - Product catalog
├── Cart Service (8083) - Shopping cart
├── Order Service (8084) - Order management
├── Payment Service (8085) - Payments
├── Delivery Service (8086) - Delivery tracking
├── Notification Service (8087) - Notifications
├── Analytics Service (8088) - Analytics
└── API Gateway (8090) - Single entry point

7 Microfrontends:
├── Shell App (4200) - Main container
├── Auth MFE - Login/Signup
├── Product MFE - Product listing
├── Cart MFE - Shopping cart
├── Orders MFE - Order history
├── Profile MFE - User profile
├── Delivery MFE - Delivery tracking
└── Notifications MFE - Notifications

Infrastructure:
├── Consul - Service discovery
├── 5 MySQL databases - One per service
├── MongoDB - For notifications & analytics
└── Redis - For cart sessions
```

## ✨ You're All Set!

Just run: **START_PROJECT_NOW.bat**

The script handles everything automatically!
