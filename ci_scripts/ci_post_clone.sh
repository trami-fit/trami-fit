#!/bin/bash

# CI Post-Clone Script for Flutter iOS Build
# This script runs after the source code is fetched

set -e

echo "🔧 CI Post-Clone Script Started - $(date)"
echo "📂 Current directory: $(pwd)"
echo "📂 CI_PRIMARY_REPOSITORY_PATH: $CI_PRIMARY_REPOSITORY_PATH"

# Set UTF-8 encoding for CocoaPods
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

echo "📱 Installing Flutter dependencies..."
flutter pub get

echo "🍎 Setting up iOS dependencies..."
cd ios

# Verify we're in the iOS directory
if [ ! -f "Podfile" ]; then
    echo "❌ Podfile not found in $(pwd)"
    ls -la
    exit 1
fi

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

echo "🔍 Verifying installation..."
if [ ! -f "Flutter/Generated.xcconfig" ]; then
    echo "❌ Generated.xcconfig not found after pod install"
    ls -la Flutter/
    exit 1
fi

if [ ! -d "Pods/Target Support Files/Pods-Runner" ]; then
    echo "❌ Pods Target Support Files not found"
    ls -la Pods/Target\ Support\ Files/ || echo "Pods/Target Support Files/ does not exist"
    exit 1
fi

echo "✅ CI Post-Clone setup complete - $(date)"
