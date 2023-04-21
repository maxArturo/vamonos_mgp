#!/bin/bash
set -euo pipefail

REQUIRED_VARS=("SEMVER" "BUILD_NUMBER")

# Loop through required environment variables and check if they are set
for VAR_NAME in "${REQUIRED_VARS[@]}"; do
        if [[ -z "${!VAR_NAME}" ]]; then
                echo "ERROR: Required environment variable $VAR_NAME is not set."
                exit 1
        fi
done

flutter clean &&
        rm ios/Podfile.lock pubspec.lock &&
        rm -rf ios/Pods ios/Runner.xcworkspace &&
        flutter build ipa --build-name="$SEMVER" --build-number="$BUILD_NUMBER" \
                --obfuscate --split-debug-info=build/ios/versions/"$SEMVER"+"$BUILD_NUMBER"

cd ios
source fastlane/.env
fastlane beta
