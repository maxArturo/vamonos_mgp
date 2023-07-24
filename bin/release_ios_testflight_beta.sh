#!/bin/bash
set -euo pipefail

SEMVER=$(cat <pubspec.yaml | awk '/version:/ {print $2}' | awk -F \+ '{print $1}')
BUILD_NUMBER=$(cat <pubspec.yaml | awk '/version:/ {print $2}' | awk -F \+ '{print $2}')

echo "Building release version of app for beta release in TestFlight"
echo "Semver is: $SEMVER"
echo "build no is: $BUILD_NUMBER"

flutter clean &&
        rm ios/Podfile.lock pubspec.lock &&
        rm -rf ios/Pods ios/Runner.xcworkspace &&
        flutter build ipa \
                --dart-define-from-file './env.prod.json' \
                --dart-define="BUILD_ID=$SEMVER.$BUILD_NUMBER" \
                --build-name="$SEMVER" --build-number="$BUILD_NUMBER" \
                --obfuscate --split-debug-info=build/ios/versions/"$SEMVER"+"$BUILD_NUMBER"

cd ios
source fastlane/.env
fastlane beta
