# Anna Delivery Live Tracking App

A beautiful, responsive live tracking application for freight delivery built with Angular and Capacitor.

## Features

✨ Real-time GPS tracking
✨ Route timeline with milestones
✨ Cargo integrity monitoring
✨ Driver profile management
✨ Toast notifications
✨ Mobile-optimized UI with Material Design 3

## Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v16 or higher)
- **npm** (v8 or higher)
- **Java Development Kit (JDK)** (v11 or higher)
- **Android SDK** & **Android Studio**
- **Git**

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/hopevoice18-stack/anna-delivery-app.git
cd anna-delivery-app
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Build the Web Project

```bash
npm run build
```

### 4. Add Android Platform

```bash
npm run cap:add:android
```

## Building APK

### Method 1: Using Capacitor CLI (Recommended for Development)

```bash
npm run build:android
npm run cap:open:android
```

This opens Android Studio. Then:

1. Click **Build** → **Build Bundle(s) / APK(s)** → **Build APK(s)**
2. The APK will be generated at: `android/app/build/outputs/apk/debug/app-debug.apk`

### Method 2: Using Gradle (Production Build)

```bash
cd android
./gradlew assembleRelease
```

The signed APK will be at: `app/build/outputs/apk/release/app-release.apk`

### Method 3: Direct Build Command

```bash
npm run build && cap sync android && cd android && ./gradlew assembleDebug
```

## Project Structure

```
anna-delivery-app/
├── src/
│   ├── app/
│   │   ├── app.component.ts
│   │   ├── app.component.html
│   │   ├── app.component.css
│   │   └── app.module.ts
│   ├── styles.css
│   └── index.html
├── android/              # Generated after cap:add:android
├── www/                  # Built web files
├── capacitor.config.json # Capacitor configuration
├── package.json
├── angular.json
└── tsconfig.json
```

## Development

### Start Development Server

```bash
npm start
```

Open http://localhost:4200/ in your browser.

### Sync Changes to Android

```bash
npm run cap:sync
```

### Debug on Device

```bash
npm run cap:open:android
```

Then press Run (Shift + F10) in Android Studio.

## Configuration

Edit `capacitor.config.json` to customize:

- App ID: `com.annadelivery.tracking`
- App Name: `Anna Delivery`
- Web directory: `www`

## Build Troubleshooting

### Issue: Gradle build fails

**Solution:**
```bash
cd android
./gradlew clean
cd ..
npm run cap:sync
```

### Issue: "SDK not found"

**Solution:** Set `ANDROID_HOME` environment variable:

```bash
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin
```

### Issue: Capacitor commands not found

**Solution:**
```bash
npm install -g @capacitor/cli
```

## Deployment

### Generate Signed APK for Play Store

1. Create a keystore:
```bash
keytool -genkey -v -keystore ~/my-release-key.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias
```

2. Edit `android/app/build.gradle`:

```gradle
signingConfigs {
    release {
        storeFile file('/path/to/my-release-key.keystore')
        storePassword 'password'
        keyAlias 'my-key-alias'
        keyPassword 'password'
    }
}
```

3. Build:
```bash
cd android && ./gradlew assembleRelease
```

## Support

For issues or questions, please open an issue on GitHub.

## License

MIT License - see LICENSE file for details.
