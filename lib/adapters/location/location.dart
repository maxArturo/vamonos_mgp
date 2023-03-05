import 'package:location/location.dart';
import 'package:vamonos_mgp/util/errors.dart';

class LocationAdapter {
  final Location _systemLocation;
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  LocationAdapter() : _systemLocation = Location();

  Stream<LocationData> updateStream() => _systemLocation.onLocationChanged;

  Future<LocationData> getLocationData() async {
    _serviceEnabled = await _systemLocation.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _systemLocation.requestService();
      if (!_serviceEnabled) {
        throw ServiceUnavailableError();
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
  }
}
