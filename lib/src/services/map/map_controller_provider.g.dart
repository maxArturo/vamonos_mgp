// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_controller_provider.dart';

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

String _$StopViewMapControllerHash() =>
    r'dc02105c4d9820a4260b2b0af5493cab0dd7e7ee';

/// See also [StopViewMapController].
final stopViewMapControllerProvider =
    AsyncNotifierProvider<StopViewMapController, MapController>(
  StopViewMapController.new,
  name: r'stopViewMapControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$StopViewMapControllerHash,
);
typedef StopViewMapControllerRef = AsyncNotifierProviderRef<MapController>;

abstract class _$StopViewMapController extends AsyncNotifier<MapController> {
  @override
  FutureOr<MapController> build();
}

String _$RouteViewMapControllerHash() =>
    r'329a3855556e400e8c49565a84b067f4ed075558';

/// See also [RouteViewMapController].
final routeViewMapControllerProvider =
    AsyncNotifierProvider<RouteViewMapController, MapController>(
  RouteViewMapController.new,
  name: r'routeViewMapControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$RouteViewMapControllerHash,
);
typedef RouteViewMapControllerRef = AsyncNotifierProviderRef<MapController>;

abstract class _$RouteViewMapController extends AsyncNotifier<MapController> {
  @override
  FutureOr<MapController> build();
}
