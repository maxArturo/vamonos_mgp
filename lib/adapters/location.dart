import 'package:location/location.dart';

Location locationProvider = Location();

var _serviceEnabled = false;
PermissionStatus _permissionGranted = PermissionStatus.denied;
LocationData? _locationData;

Future<LocationData> getLocationData() async {
  _serviceEnabled = await locationProvider.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await locationProvider.requestService();
    if (!_serviceEnabled) {}
  }

  _permissionGranted = await locationProvider.hasPermission();

  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await locationProvider.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      throw UnsupportedError("Permission not granted");
    }
  }

  _locationData = await locationProvider.getLocation();
  return _locationData!;
}
