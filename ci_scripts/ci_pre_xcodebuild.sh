#!/bin/bash

# CI Pre-Xcodebuild Script for Flutter iOS Build
# This script runs before the Xcode build process

set -e

echo "🔧 CI Pre-Xcodebuild Script Started - $(date)"
echo "📂 Current directory: $(pwd)"
echo "📂 CI_PRIMARY_REPOSITORY_PATH: $CI_PRIMARY_REPOSITORY_PATH"

# Set UTF-8 encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Navigate to the project root
if [ -n "$CI_PRIMARY_REPOSITORY_PATH" ]; then
    cd "$CI_PRIMARY_REPOSITORY_PATH"
    echo "📂 Changed to repository path: $(pwd)"
else
    echo "⚠️  CI_PRIMARY_REPOSITORY_PATH not set, using current directory"
fi

# Verify we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ pubspec.yaml not found in $(pwd)"
    ls -la
    exit 1
fi

echo "📱 Ensuring Flutter dependencies are up to date..."
flutter pub get

echo "🍎 Ensuring iOS dependencies are properly set up..."
cd ios

# Verify we're in the iOS directory
if [ ! -f "Podfile" ]; then
    echo "❌ Podfile not found in $(pwd)"
    ls -la
    exit 1
fi

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

echo "🔍 Final verification..."
echo "📄 Generated.xcconfig exists: $([ -f "Flutter/Generated.xcconfig" ] && echo "✅ YES" || echo "❌ NO")"
echo "📁 Pods directory exists: $([ -d "Pods" ] && echo "✅ YES" || echo "❌ NO")"
echo "📄 Required xcfilelist files:"
for file in "${REQUIRED_FILES[@]}"; do
    echo "  - $file: $([ -f "$file" ] && echo "✅ EXISTS" || echo "❌ MISSING")"
done

echo "✅ CI Pre-Xcodebuild setup complete - $(date)"
