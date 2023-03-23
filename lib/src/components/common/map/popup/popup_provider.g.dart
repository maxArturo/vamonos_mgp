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

String _$stopViewPopupControllerHash() =>
    r'c91f83bc1f2dde7d2b0c1795552ce14c08b4968c';

/// See also [stopViewPopupController].
final stopViewPopupControllerProvider = AutoDisposeProvider<PopupController>(
  stopViewPopupController,
  name: r'stopViewPopupControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stopViewPopupControllerHash,
);
typedef StopViewPopupControllerRef = AutoDisposeProviderRef<PopupController>;
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
String _$routeViewPopupControllerHash() =>
    r'bbdd39c594dd5a638801d027d1f7b52f4e6e7f2e';

/// See also [routeViewPopupController].
final routeViewPopupControllerProvider = AutoDisposeProvider<PopupController>(
  routeViewPopupController,
  name: r'routeViewPopupControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routeViewPopupControllerHash,
);
typedef RouteViewPopupControllerRef = AutoDisposeProviderRef<PopupController>;
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
