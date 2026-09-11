# Anna Delivery Live Tracking App

**Version:** 1.0.0  
**Platform:** Android (APK)  
**Framework:** Angular + Capacitor  
**Status:** ✅ Ready for Build

---

## 🎯 Quick Start

### Prerequisites
- ✅ Node.js 16+
- ✅ Java JDK 11+
- ✅ Android SDK
- ✅ Git

### Build APK in 3 Steps

**Option 1: Automated Build (Recommended)**

```bash
# macOS / Linux
chmod +x build.sh
./build.sh

# Windows
build.bat
```

**Option 2: Manual Build**

```bash
npm install
npm run build
npm run cap:add:android
npm run build:android
cd android && ./gradlew assembleDebug && cd ..
```

### 📱 Install on Device

```bash
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

---

## 📂 Project Structure

```
anna-delivery-app/
├── src/
│   ├── app/
│   │   ├── app.component.ts
│   │   ├── app.component.html
│   │   ├── app.module.ts
│   │   └── tracking.html          ← Live tracking UI
│   ├── index.html
│   ├── main.ts
│   └── styles.css
├── android/                         ← Android project
│   ├── app/
│   │   ├── build/                 ← APK outputs here
���   │   │   └── outputs/apk/debug/
│   │   │       └── app-debug.apk  ← Your APK file
│   │   └── src/
│   ├── gradle/
│   ├── build.gradle
│   ├── settings.gradle
│   ├── gradlew                    ← Gradle wrapper (macOS/Linux)
│   └── gradlew.bat               ← Gradle wrapper (Windows)
├── capacitor.config.json
├── package.json
├── angular.json
├── tsconfig.json
├── BUILD_INSTRUCTIONS.md          ← Detailed build guide
├── README.md
├── build.sh                       ← Linux/macOS build script
└── build.bat                      ← Windows build script
```

---

## ✨ Features

✅ **Real-time Tracking**  
✅ **Route Timeline with Milestones**  
✅ **Cargo Integrity Monitoring**  
✅ **Driver Profile Management**  
✅ **Toast Notifications**  
✅ **Material Design 3 UI**  
✅ **Responsive Mobile Layout**  

---

## 🔧 Available Commands

| Command | Purpose |
|---------|----------|
| `npm install` | Install dependencies |
| `npm start` | Dev server (http://localhost:4200) |
| `npm run build` | Build web project |
| `npm run cap:add:android` | Add Android platform |
| `npm run cap:sync` | Sync web files to Android |
| `npm run cap:open:android` | Open Android Studio |
| `npm run build:android` | Full Android build |
| `./build.sh` | Automated build (macOS/Linux) |
| `build.bat` | Automated build (Windows) |

---

## 🛠️ Troubleshooting

### Gradle Build Fails
```bash
cd android
./gradlew clean
cd ..
npm run cap:sync
```

### SDK Not Found
```bash
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin
```

### Port 4200 Already in Use
```bash
npm start -- --port 4300
```

---

## 📦 APK Output Locations

- **Debug APK:** `android/app/build/outputs/apk/debug/app-debug.apk`
- **Release APK:** `android/app/build/outputs/apk/release/app-release.apk`

---

## 🚀 Next Steps

1. **Run automated build:** `./build.sh` or `build.bat`
2. **Wait for completion** (5-10 minutes)
3. **Install on device:** `adb install android/app/build/outputs/apk/debug/app-debug.apk`
4. **Test the app** on your Android device

---

## 📞 Support

For issues or questions:
1. Check `BUILD_INSTRUCTIONS.md` for detailed guidance
2. Review `README.md` for complete documentation
3. Open a GitHub issue for bugs

---

**Happy Building! 🎉**
