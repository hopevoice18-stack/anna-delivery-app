@echo off
REM Anna Delivery APK Build Script for Windows

echo.
echo 🚀 Anna Delivery APK Build Script
echo ================================="
echo.

REM Step 1: Install dependencies
echo Step 1: Installing dependencies...
call npm install
if %errorlevel% neq 0 (
    echo Failed to install dependencies
    exit /b 1
)
echo ✓ Dependencies installed
echo.

REM Step 2: Build web project
echo Step 2: Building web project...
call npm run build
if %errorlevel% neq 0 (
    echo Failed to build web project
    exit /b 1
)
echo ✓ Web project built
echo.

REM Step 3: Add Android platform
echo Step 3: Adding Android platform...
if not exist "android" (
    call npm run cap:add:android
) else (
    echo ✓ Android platform already exists
)
echo.

REM Step 4: Sync changes
echo Step 4: Syncing changes to Android...
call npm run cap:sync
if %errorlevel% neq 0 (
    echo Failed to sync Android project
    exit /b 1
)
echo ✓ Android project synced
echo.

REM Step 5: Build APK
echo Step 5: Building APK (Debug)...
cd android
call gradlew.bat assembleDebug
if %errorlevel% neq 0 (
    echo Failed to build APK
    cd ..
    exit /b 1
)
cd ..
echo ✓ APK built successfully
echo.

echo =================================
echo ✓ BUILD COMPLETE!
echo =================================
echo.
echo 📦 APK Location: android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo 📱 To install on device: adb install android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo 📚 For more info, see: BUILD_INSTRUCTIONS.md
echo.
pause
