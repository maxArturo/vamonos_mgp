#!/bin/bash
set -euo pipefail

SEMVER=$(cat <pubspec.yaml | awk '/version:/ {print $2}' | awk -F \+ '{print $1}')
BUILD_NUMBER=$(cat <pubspec.yaml | awk '/version:/ {print $2}' | awk -F \+ '{print $2}')

echo "Building release version of app for beta release in Google Play Store"
echo "Semver is: $SEMVER"
echo "build no is: $BUILD_NUMBER"

flutter build appbundle \
        --dart-define-from-file './env.prod.json' \
        --build-name="$SEMVER" --build-number="$BUILD_NUMBER" \
        --obfuscate --split-debug-info=build/android/versions/"$SEMVER"+"$BUILD_NUMBER"

# cd android
# fastlane supply
