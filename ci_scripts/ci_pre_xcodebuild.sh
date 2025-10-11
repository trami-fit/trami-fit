#!/bin/bash

# CI Pre-Xcodebuild Script for Flutter iOS Build
# This script runs before the Xcode build process

set -e

echo "🔧 Pre-Xcodebuild setup..."

# Set UTF-8 encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Navigate to the project root
cd "$CI_PRIMARY_REPOSITORY_PATH"

echo "📱 Ensuring Flutter dependencies are up to date..."
flutter pub get

echo "🍎 Ensuring iOS dependencies are properly set up..."
cd ios

# Verify that Generated.xcconfig exists
if [ ! -f "Flutter/Generated.xcconfig" ]; then
    echo "⚠️  Generated.xcconfig not found, regenerating..."
    cd ..
    flutter clean
    flutter pub get
    cd ios
fi

# Verify Pods are installed
if [ ! -d "Pods" ]; then
    echo "⚠️  Pods directory not found, reinstalling..."
    pod install --repo-update
fi

# Verify required xcfilelist files exist
REQUIRED_FILES=(
    "Pods/Target Support Files/Pods-Runner/Pods-Runner-frameworks-Release-input-files.xcfilelist"
    "Pods/Target Support Files/Pods-Runner/Pods-Runner-frameworks-Release-output-files.xcfilelist"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "⚠️  Required file $file not found, reinstalling Pods..."
        rm -rf Pods Podfile.lock
        pod install --repo-update
        break
    fi
done

echo "✅ Pre-Xcodebuild setup complete!"
