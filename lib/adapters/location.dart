import 'package:location/location.dart';

Location location = Location();

var _serviceEnabled = false;
PermissionStatus _permissionGranted = PermissionStatus.denied;
LocationData? _locationData;

Future<LocationData> getLocationData() async {
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {}
  }

  _permissionGranted = await location.hasPermission();

  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      throw UnsupportedError("Permission not granted");
    }
  }

  _locationData = await location.getLocation();
  return _locationData!;
}
