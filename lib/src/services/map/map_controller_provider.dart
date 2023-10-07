import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/components/common/map/config.dart';
import 'package:vamonos_mgp/src/entities/coordinate.dart';
import 'package:vamonos_mgp/src/services/location/location_provider.dart';
import 'package:vamonos_mgp/src/services/map/map_event_provider.dart';

part 'map_controller_provider.g.dart';

abstract class BaseMapController extends AsyncNotifier<MapController> {}

mixin MapFunctionality on AsyncNotifier<MapController> {
  final _mapInitializer = Completer<MapController>();
  @override
  Future<MapController> build() {
    return _mapInitializer.future;
  }

  initialize(MapController mc) {
    state = const AsyncLoading();
    debugPrint(
        "[MapControllerService]: map initializer completed? ${_mapInitializer.isCompleted}");
    if (!_mapInitializer.isCompleted) {
      _mapInitializer.complete(mc);
    } else {
      state = AsyncData(mc);
    }

    mc.mapEventSink.add(MapEventInitialized(
        bounds: mc.bounds!, zoom: mc.zoom, center: mc.center));

    return mc;
  }

  get initialized => _mapInitializer.isCompleted;

  resetMapLocation() => updateMapLocation(defaultCenterLocation);

  recenterMapLocation() => ref
      .read(updatedLocationServiceProvider)
      .whenData((value) => value.map((el) => updateMapLocation(el)));

  void updateMapLocation(Coordinate location) {
    state.whenData((controller) {
      controller.moveAndRotate(
          LatLng(location.latitude, location.longitude), 17, 0);
      controller.mapEventSink.add(MapEventInitialized(
          bounds: controller.bounds!,
          zoom: controller.zoom,
          center: controller.center));
    });
  }

  void setZoom(double newZoom) {
    state.whenData((controller) => controller.move(controller.center, newZoom));
  }
}

@Riverpod(keepAlive: true)
class StopViewMapController extends _$StopViewMapController
    with MapFunctionality {
  /// override is needed because of riverpod generator
  @override
  Future<MapController> build() {
    return _mapInitializer.future;
  }
}

@Riverpod(keepAlive: true)
class RouteViewMapController extends _$RouteViewMapController
    with MapFunctionality {
  /// override is needed because of riverpod generator
  @override
  Future<MapController> build() {
    return _mapInitializer.future;
  }
}
