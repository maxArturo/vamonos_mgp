# vamonos_mgp

Alternate flutter app for Municipio de General Purreydon's [public transit tracker](https://appsl.mardelplata.gob.ar/app_cuando_llega/web/cuando.php).

![image](https://github.com/maxArturo/vamonos_mgp/assets/5713763/a612246d-94a1-497d-98b3-2d6e2278a3f8)


## Why?

I got fed up with the original one. Please note that the data will _not_ be any better than what the "source" API surfaces; just prettier and hopefully more user-friendly.

## Getting Started

In general, this is a simple Flutter app - being able to run `flutter doctor` on your IDE should get you 99% of the way. Then, you can run this app in any IDE under a debugger and runtime of your choice.

## Roadmap

### MVP

This includes being able to see expected arrival times for stops near you, a list of routes displaying available stops and baseline UI niceties.

### Post release nice to haves

User feedback and bug squashing will be the first priority after release as quick followup.

## Services and considerations

Nothing in life is free. For this app, the external services used are generously free but will not be useful if the app sees expanded use. These are:

- OSM for mapping
- [nominatim](https://nominatim.org/) for geocoding and reverse (TBD, not used yet)

## JSON Serialization

THis is handled by `json_annotation` package. Run the code generation script via

```shell
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Release and build

### beta release to app store (iOS)

The script for this uses [fastlane](https://docs.fastlane.tools/getting-started/ios/beta-deployment/) to handle building and releasing to TestFlight. Be sure to have a file under `ios/fastlane/.env` file with the following params:

```shell
export FASTLANE_APPLE_ID="xxx" # your Apple Developer Portal username
export APP_STORE_CONNECT_KEY_IDENTIFIER="xxx"
export APP_STORE_CONNECT_ISSUER_ID="xxx"
export APP_STORE_CONNECT_PRIVATE_KEY_PATH="fastlane/appstore_connect_api_key.p8" # need to have this private key available

```

Then run the following command:

```shell
SEMVER=<semver> BUILD_NUMBER=<build no> ./bin/build_release_ios.sh
```
