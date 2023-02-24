import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

/// intended to be used in Provider(s).
class MapProviderStore {
  MapController? _mapController;

  get mapController => _mapController;

  updateMapLocation(LocationData location) =>
      _mapController!.move(LatLng(location.latitude!, location.longitude!), 18);

  initializeMapController() => _mapController = MapController();
}
