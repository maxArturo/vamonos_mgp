// import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/src/util/errors.dart';
import 'package:vamonos_mgp/src/util/fn.dart';

class LocationAdapter {
  final Location _systemLocation;
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  LocationAdapter() : _systemLocation = Location();

  get updateStream => _systemLocation.onLocationChanged;

  Future<Either<AppError, LocationData>> getLocationData() async {
    return catching(() async {
      _serviceEnabled = await _systemLocation.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await _systemLocation.requestService();
        if (!_serviceEnabled) {
          throw LocationServiceError();
        }
      }

      _permissionGranted = await _systemLocation.hasPermission();

      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await _systemLocation.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          throw PermissionError;
        }
      }

      return await _systemLocation.getLocation();
    })
        .leftMap((l) => castOrFallback(l, UntypedError()))
        .traverseFuture((r) async => (await r));
  }
}
