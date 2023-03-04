import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/adapters/location.dart';

/// intended to be used in Provider(s).
class LocationProviderStore with ChangeNotifier {
  /// flutter_map control props
  MapController? _mapController;
  get mapController => _mapController;

  /// this should be called once on startup, so that this map controller is
  /// attached to the map before any calls are made to it.
  initializeMapController() => _mapController = MapController();

  /// public map manipulation methods
  recenterMapLocation() => updateMapLocation(latestLocationData);
  updateMapLocation(LocationData location) {
    _mapController!
        .moveAndRotate(LatLng(location.latitude!, location.longitude!), 17, 0);
  }

  /// this will be periodically updated from the location provider's stream
  LocationData latestLocationData =
      LocationData.fromMap({'latitude': 0.0, 'longitude': 0.0});

  final StreamController<LocationData> _currentLocationStreamController =
      StreamController();

  LocationProviderStore() {
    _currentLocationStreamController
        .addStream(locationProvider.onLocationChanged);
    _currentLocationStreamController.stream.listen((e) {
      latestLocationData = e;
      notifyListeners();
    });
  }

  LocationData? _displayedLocation;
  LocationData? get displayedLocation => _displayedLocation;

  Future<LocationData> get currentLocationData async {
    latestLocationData = await getLocationData();
    notifyListeners();
    return latestLocationData;
  }
}
