#!/bin/bash

# CI Post-Clone Script for Flutter iOS Build
# This script runs after the source code is fetched

set -e

echo "🔧 Setting up Flutter environment..."

# Set UTF-8 encoding for CocoaPods
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Navigate to the project root
cd "$CI_PRIMARY_REPOSITORY_PATH"

echo "📱 Installing Flutter dependencies..."
flutter pub get

echo "🍎 Setting up iOS dependencies..."
cd ios

# Clean any existing Pods
if [ -d "Pods" ]; then
    echo "🧹 Cleaning existing Pods..."
    rm -rf Pods
fi

if [ -f "Podfile.lock" ]; then
    echo "🧹 Removing Podfile.lock..."
    rm -f Podfile.lock
fi

# Install CocoaPods dependencies
echo "📦 Installing CocoaPods dependencies..."
pod install --repo-update

echo "✅ CI Post-Clone setup complete!"
