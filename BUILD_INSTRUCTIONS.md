# Complete APK Build Guide for Anna Delivery App

## Quick Start (5-10 minutes)

### Step 1: Setup Environment

1. **Install Node.js & npm**
   - Download from: https://nodejs.org/
   - Verify: `node --version` and `npm --version`

2. **Install Java Development Kit (JDK)**
   - Download JDK 11 or higher
   - Verify: `java -version`

3. **Install Android Studio**
   - Download from: https://developer.android.com/studio
   - During installation, select "Android SDK Platform"
   - Note the Android SDK location (e.g., ~/Android/Sdk)

### Step 2: Clone & Install

```bash
git clone https://github.com/hopevoice18-stack/anna-delivery-app.git
cd anna-delivery-app
npm install
```

### Step 3: Build Web Files

```bash
npm run build
```

### Step 4: Add Android Platform

```bash
npm run cap:add:android
```

### Step 5: Build APK

**Option A: Debug APK (Faster, for testing)**
```bash
npm run build:android
npm run cap:open:android
```

In Android Studio:
- Click **Build** → **Build Bundle(s) / APK(s)** → **Build APK(s)**
- Wait for build to complete
- APK location: `android/app/build/outputs/apk/debug/app-debug.apk`

**Option B: Release APK (Slower, for distribution)**
```bash
cd android
./gradlew assembleRelease
```
- APK location: `android/app/build/outputs/apk/release/app-release.apk`

### Step 6: Install on Device

```bash
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

---

## Detailed Commands Reference

| Command | Purpose |
|---------|----------|
| `npm install` | Install all dependencies |
| `npm run build` | Build Angular web project |
| `npm run cap:add:android` | Add Android platform (run once) |
| `npm run cap:sync` | Sync web files to Android |
| `npm run cap:open:android` | Open Android Studio |
| `npm run build:android` | Full build for Android |
| `npm start` | Dev server (http://localhost:4200) |

---

## File Locations After Build

```
anna-delivery-app/
├── www/                          ← Web build output
├── android/                       ← Android project
│   ├── app/build/outputs/apk/
│   │   ├── debug/app-debug.apk   ← Debug APK (ready to install)
│   │   └── release/              ← Release APK (when built)
│   └── app/build/                ← Build cache
└── dist/                          ← TypeScript build output
```

---

## Environment Variables

Set these if commands fail:

```bash
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin
export JAVA_HOME=/usr/libexec/java_home  # macOS
```

---

## Troubleshooting

### "Gradle build failed"
```bash
cd android && ./gradlew clean && cd ..
npm run cap:sync
```

### "SDK not found"
- Open Android Studio
- Go to **SDK Manager** → copy SDK path
- Set: `export ANDROID_HOME=/path/to/sdk`

### "adb not found"
```bash
export PATH=$PATH:~/Android/Sdk/platform-tools
```

### Port 4200 already in use
```bash
npm start -- --port 4300
```

---

## Installation on Device

### Via USB Cable (Debug APK)

1. Enable Developer Mode on Android device
2. Enable USB Debugging
3. Connect device to PC
4. Run: `adb install android/app/build/outputs/apk/debug/app-debug.apk`

### Via File Transfer

1. Copy `app-debug.apk` to device
2. Open with file manager
3. Tap to install

### Via Google Play Store (Release APK)

- Requires signing and Play Store registration
- See README.md Deployment section

---

## Next Steps

1. **Customize**: Edit `src/app/app.component.html` with your tracking HTML
2. **Test**: Run `npm start` to preview in browser
3. **Build**: Generate APK following Step 5 above
4. **Distribute**: Share APK or upload to Play Store

---

**Questions?** Check README.md or open a GitHub issue.
