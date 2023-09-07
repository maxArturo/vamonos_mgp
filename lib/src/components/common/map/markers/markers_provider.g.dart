// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allMarkersHash() => r'fe31ccff39a2351ece3e40993d5c31c6fc9403b4';

/// See also [allMarkers].
@ProviderFor(allMarkers)
final allMarkersProvider =
    AutoDisposeFutureProvider<Either<AppError, List<StopMarker>>>.internal(
  allMarkers,
  name: r'allMarkersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allMarkersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllMarkersRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<StopMarker>>>;
String _$allMarkersByRouteHash() => r'939b17dcffa82a9ca3efe903d28605be04197413';

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

/// See also [allMarkersByRoute].
@ProviderFor(allMarkersByRoute)
const allMarkersByRouteProvider = AllMarkersByRouteFamily();

/// See also [allMarkersByRoute].
class AllMarkersByRouteFamily
    extends Family<AsyncValue<Either<AppError, List<StopMarker>>>> {
  /// See also [allMarkersByRoute].
  const AllMarkersByRouteFamily();

  /// See also [allMarkersByRoute].
  AllMarkersByRouteProvider call(
    DirectedRoute directedRoute,
  ) {
    return AllMarkersByRouteProvider(
      directedRoute,
    );
  }

  @override
  AllMarkersByRouteProvider getProviderOverride(
    covariant AllMarkersByRouteProvider provider,
  ) {
    return call(
      provider.directedRoute,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'allMarkersByRouteProvider';
}

/// See also [allMarkersByRoute].
class AllMarkersByRouteProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<StopMarker>>> {
  /// See also [allMarkersByRoute].
  AllMarkersByRouteProvider(
    DirectedRoute directedRoute,
  ) : this._internal(
          (ref) => allMarkersByRoute(
            ref as AllMarkersByRouteRef,
            directedRoute,
          ),
          from: allMarkersByRouteProvider,
          name: r'allMarkersByRouteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allMarkersByRouteHash,
          dependencies: AllMarkersByRouteFamily._dependencies,
          allTransitiveDependencies:
              AllMarkersByRouteFamily._allTransitiveDependencies,
          directedRoute: directedRoute,
        );

  AllMarkersByRouteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.directedRoute,
  }) : super.internal();

  final DirectedRoute directedRoute;

  @override
  Override overrideWith(
    FutureOr<Either<AppError, List<StopMarker>>> Function(
            AllMarkersByRouteRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllMarkersByRouteProvider._internal(
        (ref) => create(ref as AllMarkersByRouteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        directedRoute: directedRoute,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<AppError, List<StopMarker>>>
      createElement() {
    return _AllMarkersByRouteProviderElement(this);
  }

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

mixin AllMarkersByRouteRef
    on AutoDisposeFutureProviderRef<Either<AppError, List<StopMarker>>> {
  /// The parameter `directedRoute` of this provider.
  DirectedRoute get directedRoute;
}

class _AllMarkersByRouteProviderElement
    extends AutoDisposeFutureProviderElement<Either<AppError, List<StopMarker>>>
    with AllMarkersByRouteRef {
  _AllMarkersByRouteProviderElement(super.provider);

  @override
  DirectedRoute get directedRoute =>
      (origin as AllMarkersByRouteProvider).directedRoute;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
