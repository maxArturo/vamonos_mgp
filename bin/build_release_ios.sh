#!/bin/sh

flutter clean \
        && rm ios/Podfile.lock pubspec.lock \
        && rm -rf ios/Pods ios/Runner.xcworkspace \
        && flutter build ipa --build-name=1.0.0 --build-number=4 \
        --obfuscate --split-debug-info=1.0.0+4
