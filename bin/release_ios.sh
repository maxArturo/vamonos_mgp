#!/bin/bash
set -euo pipefail

SEMVER=$(cat <pubspec.yaml | awk '/version:/ {print $2}' | awk -F \+ '{print $1}')
BUILD_NUMBER=$(cat <pubspec.yaml | awk '/version:/ {print $2}' | awk -F \+ '{print $2}')

flutter clean &&
        rm ios/Podfile.lock pubspec.lock &&
        rm -rf ios/Pods ios/Runner.xcworkspace &&
        flutter build ipa --dart-define-from-file './env.prod.json' --build-name="$SEMVER" --build-number="$BUILD_NUMBER" \
                --obfuscate --split-debug-info=build/ios/versions/"$SEMVER"+"$BUILD_NUMBER"

cd ios
source fastlane/.env
fastlane beta
