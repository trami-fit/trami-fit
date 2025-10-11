#!/bin/sh
set -e
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PWD/flutter/bin:$PATH"
flutter --version
