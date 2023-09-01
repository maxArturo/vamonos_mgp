// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markers_provider.dart';

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

String _$markersMGPStoreHash() => r'72bcd4fbbe009359fa13b625ac906f802ec0cf0c';

/// See also [markersMGPStore].
final markersMGPStoreProvider =
    AutoDisposeFutureProvider<Either<AppError, Map<RouteStop, StopMarker>>>(
  markersMGPStore,
  name: r'markersMGPStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$markersMGPStoreHash,
);
typedef MarkersMGPStoreRef = AutoDisposeFutureProviderRef<
    Either<AppError, Map<RouteStop, StopMarker>>>;
String _$allMarkersMGPHash() => r'0f37349a69fdec0db6882120671690ac556eac93';

/// See also [allMarkersMGP].
final allMarkersMGPProvider =
    AutoDisposeFutureProvider<Either<AppError, List<StopMarker>>>(
  allMarkersMGP,
  name: r'allMarkersMGPProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allMarkersMGPHash,
);
typedef AllMarkersMGPRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<StopMarker>>>;
String _$allMarkersByRouteMGPHash() =>
    r'651f3fde46f1b1ccc15de70d3be4bef44ec8a7f3';

/// See also [allMarkersByRouteMGP].
class AllMarkersByRouteMGPProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<StopMarker>>> {
  AllMarkersByRouteMGPProvider(
    this.directedRoute,
  ) : super(
          (ref) => allMarkersByRouteMGP(
            ref,
            directedRoute,
          ),
          from: allMarkersByRouteMGPProvider,
          name: r'allMarkersByRouteMGPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allMarkersByRouteMGPHash,
        );

  final DirectedRoute directedRoute;

  @override
  bool operator ==(Object other) {
    return other is AllMarkersByRouteMGPProvider &&
        other.directedRoute == directedRoute;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, directedRoute.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef AllMarkersByRouteMGPRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<StopMarker>>>;

/// See also [allMarkersByRouteMGP].
final allMarkersByRouteMGPProvider = AllMarkersByRouteMGPFamily();

class AllMarkersByRouteMGPFamily
    extends Family<AsyncValue<Either<AppError, List<StopMarker>>>> {
  AllMarkersByRouteMGPFamily();

  AllMarkersByRouteMGPProvider call(
    DirectedRoute directedRoute,
  ) {
    return AllMarkersByRouteMGPProvider(
      directedRoute,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<StopMarker>>>
      getProviderOverride(
    covariant AllMarkersByRouteMGPProvider provider,
  ) {
    return call(
      provider.directedRoute,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'allMarkersByRouteMGPProvider';
}
