// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$MapViewHash() => r'c03cc5e44481f0fa404013b799982cbe1292f2ed';

/// See also [MapView].
final mapViewProvider = AutoDisposeNotifierProvider<MapView, MapBrowserView>(
  MapView.new,
  name: r'mapViewProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$MapViewHash,
);
typedef MapViewRef = AutoDisposeNotifierProviderRef<MapBrowserView>;

abstract class _$MapView extends AutoDisposeNotifier<MapBrowserView> {
  @override
  MapBrowserView build();
}

String _$RouteMapViewStateHash() => r'db7453c6c733bf48ff0c4f4cb4b52e0f54ad32cb';

/// See also [RouteMapViewState].
final routeMapViewStateProvider =
    AutoDisposeNotifierProvider<RouteMapViewState, RouteMapState>(
  RouteMapViewState.new,
  name: r'routeMapViewStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$RouteMapViewStateHash,
);
typedef RouteMapViewStateRef = AutoDisposeNotifierProviderRef<RouteMapState>;

abstract class _$RouteMapViewState extends AutoDisposeNotifier<RouteMapState> {
  @override
  RouteMapState build();
}
