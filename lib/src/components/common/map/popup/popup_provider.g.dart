// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popup_provider.dart';

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

String _$StopViewPopupControllerHash() =>
    r'a007ff13419d8f61d18528b22f34d2643f67a5e1';

/// See also [StopViewPopupController].
final stopViewPopupControllerProvider =
    AutoDisposeNotifierProvider<StopViewPopupController, PopupController>(
  StopViewPopupController.new,
  name: r'stopViewPopupControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$StopViewPopupControllerHash,
);
typedef StopViewPopupControllerRef
    = AutoDisposeNotifierProviderRef<PopupController>;

abstract class _$StopViewPopupController
    extends AutoDisposeNotifier<PopupController> {
  @override
  PopupController build();
}

String _$RouteViewPopupControllerHash() =>
    r'aa7f82f533b1cde610f3ad7e6b447fc0a51773e2';

/// See also [RouteViewPopupController].
final routeViewPopupControllerProvider =
    AutoDisposeNotifierProvider<RouteViewPopupController, PopupController>(
  RouteViewPopupController.new,
  name: r'routeViewPopupControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$RouteViewPopupControllerHash,
);
typedef RouteViewPopupControllerRef
    = AutoDisposeNotifierProviderRef<PopupController>;

abstract class _$RouteViewPopupController
    extends AutoDisposeNotifier<PopupController> {
  @override
  PopupController build();
}

String _$stopViewPopupStateHash() =>
    r'ac821084dfee06274d283cc60fd72b25c2d5876c';

/// See also [stopViewPopupState].
final stopViewPopupStateProvider = AutoDisposeProvider<PopupState>(
  stopViewPopupState,
  name: r'stopViewPopupStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stopViewPopupStateHash,
);
typedef StopViewPopupStateRef = AutoDisposeProviderRef<PopupState>;
String _$routeViewPopupStateHash() =>
    r'e4f5c2539f4b2f3fbf287e29eb830981860b6d97';

/// See also [routeViewPopupState].
final routeViewPopupStateProvider = AutoDisposeProvider<PopupState>(
  routeViewPopupState,
  name: r'routeViewPopupStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routeViewPopupStateHash,
);
typedef RouteViewPopupStateRef = AutoDisposeProviderRef<PopupState>;
