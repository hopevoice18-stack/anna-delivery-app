#!/bin/bash

# Anna Delivery APK Build Script

echo "🚀 Anna Delivery APK Build Script"
echo "================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Install dependencies
echo -e "${YELLOW}Step 1: Installing dependencies...${NC}"
npm install
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to install dependencies${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Dependencies installed${NC}"

# Step 2: Build web project
echo -e "${YELLOW}Step 2: Building web project...${NC}"
npm run build
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to build web project${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Web project built${NC}"

# Step 3: Add Android platform (if not exists)
echo -e "${YELLOW}Step 3: Adding Android platform...${NC}"
if [ ! -d "android" ]; then
    npm run cap:add:android
else
    echo -e "${GREEN}✓ Android platform already exists${NC}"
fi

# Step 4: Sync changes
echo -e "${YELLOW}Step 4: Syncing changes to Android...${NC}"
npm run cap:sync
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to sync Android project${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Android project synced${NC}"

# Step 5: Build APK
echo -e "${YELLOW}Step 5: Building APK (Debug)...${NC}"
cd android
./gradlew assembleDebug
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to build APK${NC}"
    exit 1
fi
cd ..
echo -e "${GREEN}✓ APK built successfully${NC}"

# Output results
echo -e "${GREEN}\n================================="
echo -e "✓ BUILD COMPLETE!${NC}"
echo -e "${GREEN}=================================${NC}"
echo -e "\n📦 APK Location: ${YELLOW}android/app/build/outputs/apk/debug/app-debug.apk${NC}"
echo -e "\n📱 To install on device: ${YELLOW}adb install android/app/build/outputs/apk/debug/app-debug.apk${NC}"
echo -e "\n📚 For more info, see: ${YELLOW}BUILD_INSTRUCTIONS.md${NC}\n"
