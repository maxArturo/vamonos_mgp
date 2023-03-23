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

String _$allMarkersHash() => r'8b9bf8af82f7ba2e0d41fed1171c6f7e6a95da99';

/// TODO rename to allStopMarkers since it only returns route stops, not
/// landmarks on a route
///
/// Copied from [allMarkers].
final allMarkersProvider =
    AutoDisposeFutureProvider<Either<AppError, List<StopMarker>>>(
  allMarkers,
  name: r'allMarkersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allMarkersHash,
);
typedef AllMarkersRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<StopMarker>>>;
String _$allMarkersByRouteHash() => r'fe0b3e85331836f42d46a7ad5e99f1efdeee7569';

/// See also [allMarkersByRoute].
class AllMarkersByRouteProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<StopMarker>>> {
  AllMarkersByRouteProvider(
    this.directedRoute,
  ) : super(
          (ref) => allMarkersByRoute(
            ref,
            directedRoute,
          ),
          from: allMarkersByRouteProvider,
          name: r'allMarkersByRouteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allMarkersByRouteHash,
        );

  final DirectedRoute directedRoute;

  @override
  bool operator ==(Object other) {
    return other is AllMarkersByRouteProvider &&
        other.directedRoute == directedRoute;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, directedRoute.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef AllMarkersByRouteRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<StopMarker>>>;

/// See also [allMarkersByRoute].
final allMarkersByRouteProvider = AllMarkersByRouteFamily();

class AllMarkersByRouteFamily
    extends Family<AsyncValue<Either<AppError, List<StopMarker>>>> {
  AllMarkersByRouteFamily();

  AllMarkersByRouteProvider call(
    DirectedRoute directedRoute,
  ) {
    return AllMarkersByRouteProvider(
      directedRoute,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<StopMarker>>>
      getProviderOverride(
    covariant AllMarkersByRouteProvider provider,
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
  String? get name => r'allMarkersByRouteProvider';
}
