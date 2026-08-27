// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapViewHash() => r'c03cc5e44481f0fa404013b799982cbe1292f2ed';

/// See also [MapView].
@ProviderFor(MapView)
final mapViewProvider =
    AutoDisposeNotifierProvider<MapView, MapBrowserView>.internal(
  MapView.new,
  name: r'mapViewProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapViewHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapView = AutoDisposeNotifier<MapBrowserView>;
String _$routeMapViewStateHash() => r'db7453c6c733bf48ff0c4f4cb4b52e0f54ad32cb';

/// See also [RouteMapViewState].
@ProviderFor(RouteMapViewState)
final routeMapViewStateProvider =
    AutoDisposeNotifierProvider<RouteMapViewState, RouteMapState>.internal(
  RouteMapViewState.new,
  name: r'routeMapViewStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routeMapViewStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RouteMapViewState = AutoDisposeNotifier<RouteMapState>;
String _$mapOverlayStateHash() => r'26b8e536d6e2597e83fede6b9b08b4b976dcdeb9';

/// See also [MapOverlayState].
@ProviderFor(MapOverlayState)
final mapOverlayStateProvider = AutoDisposeNotifierProvider<MapOverlayState,
    Map<MapOverlaySource, String>>.internal(
  MapOverlayState.new,
  name: r'mapOverlayStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapOverlayStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapOverlayState = AutoDisposeNotifier<Map<MapOverlaySource, String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
