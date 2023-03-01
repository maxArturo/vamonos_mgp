# vamonos_mgp

Alternate flutter app for Municipio de General Purreydon's [public transit tracker](https://appsl.mardelplata.gob.ar/app_cuando_llega/web/cuando.php).

## Why?
I got fed up with the original one. Please note that the data will *not* be any better than what the "source" API surfaces; just prettier and hopefully more user-friendly.

## Getting Started

In general, this is a simple Flutter app - being able to run `flutter doctor` on your IDE should get you 99% of the way. Then, you can run this app in any IDE under a debugger and runtime of your choice. 

## TODOs

- [] WIP integrate the API into the actual app -> serialize from JSON string with https://docs.flutter.dev/development/data-and-backend/json#code-generation
- [] show more functionality, such as finding routes closest to the user
- [] show errors outside of a particular geofence
- [] request caching via https://github.com/Baseflow/flutter_cache_manager
- [] add https://pub.dev/packages/dartvcr for ease of life 

## Services and considerations

Nothing in life is free. For this app, the external services used are generously free but will not be useful if the app sees expanded use. These are:

- OSM for mapping
- [nominatim](https://nominatim.org/) for geocoding and reverse

## JSON Serialization

THis is handled by `json_annotation` package. Run the code generation script via

```shell
flutter pub run build_runner watch --delete-conflicting-outputs
```
