#!/bin/sh

# relies on config in pubspec.yaml for icon generation

flutter pub run flutter_launcher_icons

# uses a 512x512 version of the app icon and uses that to fill in splash screens
# also configured via pubspec.yaml 
flutter pub run flutter_native_splash:create
