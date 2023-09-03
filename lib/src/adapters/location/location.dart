import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/entities/coordinates.dart';
import 'package:vamonos_mgp/src/util/errors.dart';
import 'package:vamonos_mgp/src/util/fn.dart';

class LocationAdapter {
  final Location _systemLocation;
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  LocationAdapter() : _systemLocation = Location();

  Stream<Coordinate> get updateStream => _systemLocation.onLocationChanged.map(
        (locationData) => Coordinate(
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
        ),
      );

  Future<Either<AppError, Coordinate>> getLocationData() async {
    return catching(() async {
      _serviceEnabled = await _systemLocation.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await _systemLocation.requestService();
        if (!_serviceEnabled) {
          throw LocationServiceError(
              description:
                  "was not able to request or enable location services");
        }
      }

      _permissionGranted = await _systemLocation.hasPermission();

      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await _systemLocation.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          throw LocationServiceError(
              description: "Was not granted location service permissions");
        }
      }

      final rawLocation = await _systemLocation.getLocation();
      return Coordinate(
          latitude: rawLocation.latitude!, longitude: rawLocation.longitude!);
    })
        .leftMap((l) => castOrFallback(
            l,
            LocationServiceError(
                description: "an unknown location error occurred")))
        .traverseFuture((r) async => (await r));
  }
}
