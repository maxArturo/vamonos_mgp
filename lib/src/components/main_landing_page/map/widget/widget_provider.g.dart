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

String _$MapBrowserStateHash() => r'8ad85f17d0cc954e209b33b86707185a07c54ee6';

/// See also [MapBrowserState].
final mapBrowserStateProvider =
    AutoDisposeNotifierProvider<MapBrowserState, MapBrowserStateEnum>(
  MapBrowserState.new,
  name: r'mapBrowserStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$MapBrowserStateHash,
);
typedef MapBrowserStateRef
    = AutoDisposeNotifierProviderRef<MapBrowserStateEnum>;

abstract class _$MapBrowserState
    extends AutoDisposeNotifier<MapBrowserStateEnum> {
  @override
  MapBrowserStateEnum build();
}

String _$popupControllerHash() => r'1c6a3254b4e0ae38bf31122e1c3102483f1a2de3';

/// See also [popupController].
final popupControllerProvider = AutoDisposeProvider<PopupController>(
  popupController,
  name: r'popupControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popupControllerHash,
);
typedef PopupControllerRef = AutoDisposeProviderRef<PopupController>;
String _$popupStateHash() => r'723108dde4c8421ed7953617d3ec8c1666d64a8b';

/// See also [popupState].
final popupStateProvider = AutoDisposeProvider<PopupState>(
  popupState,
  name: r'popupStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$popupStateHash,
);
typedef PopupStateRef = AutoDisposeProviderRef<PopupState>;
