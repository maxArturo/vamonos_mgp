import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/adapters/location.dart';

/// intended to be used in Provider(s).
class LocationProviderStore with ChangeNotifier {
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

  void updateLocation(LocationData newLocation) {
    _displayedLocation = newLocation;
    notifyListeners();
  }

  Future<LocationData> get currentLocationData async {
    latestLocationData = await getLocationData();
    notifyListeners();
    return latestLocationData;
  }
}
