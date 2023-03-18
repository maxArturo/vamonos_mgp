// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_provider.dart';

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
    r'ef54cbd492f7dcec3501f58744ecc39a39c5df1b';

/// See also [stopViewPopupController].
final stopViewPopupControllerProvider = Provider<PopupController>(
  stopViewPopupController,
  name: r'stopViewPopupControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stopViewPopupControllerHash,
);
typedef StopViewPopupControllerRef = ProviderRef<PopupController>;
String _$stopViewPopupStateHash() =>
    r'42db9e071f6fe81a0f44f09224c07ec2768bd46c';

/// See also [stopViewPopupState].
final stopViewPopupStateProvider = Provider<PopupState>(
  stopViewPopupState,
  name: r'stopViewPopupStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stopViewPopupStateHash,
);
typedef StopViewPopupStateRef = ProviderRef<PopupState>;
String _$routeViewPopupControllerHash() =>
    r'1eb2197939889a5fb8e99ae4f8fb5c8065a37a46';

/// See also [routeViewPopupController].
final routeViewPopupControllerProvider = Provider<PopupController>(
  routeViewPopupController,
  name: r'routeViewPopupControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routeViewPopupControllerHash,
);
typedef RouteViewPopupControllerRef = ProviderRef<PopupController>;
String _$routeViewPopupStateHash() =>
    r'62d2add51b41632b3a909591dd592a174ce796a3';

/// See also [routeViewPopupState].
final routeViewPopupStateProvider = Provider<PopupState>(
  routeViewPopupState,
  name: r'routeViewPopupStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routeViewPopupStateHash,
);
typedef RouteViewPopupStateRef = ProviderRef<PopupState>;
