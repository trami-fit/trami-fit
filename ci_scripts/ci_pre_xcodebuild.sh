#!/bin/sh
set -e
export PATH="$PWD/flutter/bin:$PATH"
flutter pub get
flutter precache --ios
cd ios
pod repo update
pod install
cd ..
