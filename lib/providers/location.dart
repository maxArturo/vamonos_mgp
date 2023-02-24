import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:vamonos_mgp/adapters/location.dart';

/// intended to be used in Provider(s).
class LocationProviderStore with ChangeNotifier {
  LocationProviderStore();
  // final StreamController<LocationData> _currentLocationStreamController =
  //     StreamController();
  // Stream<LocationData> get latestLocationStream =>
  //     _currentLocationStreamController.stream;

  LocationData? _displayedLocation;

  LocationData? get displayedLocation => _displayedLocation;

  void updateLocation(LocationData newLocation) {
    _displayedLocation = newLocation;
    notifyListeners();
  }

  Future<LocationData> get currentLocationData {
    return getLocationData();
  }
}
