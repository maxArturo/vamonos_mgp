// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landmark_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$landMarkServiceHash() => r'4eb872352a6c604f8ade9ac0c5f0258687043c06';

/// See also [landMarkService].
@ProviderFor(landMarkService)
final landMarkServiceProvider = AutoDisposeProvider<LandmarkService>.internal(
  landMarkService,
  name: r'landMarkServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$landMarkServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LandMarkServiceRef = AutoDisposeProviderRef<LandmarkService>;
String _$allLandMarksBySourceHash() =>
    r'c3a587136aff4b8ebf38b55ac35d6c69d95d9b33';

/// See also [allLandMarksBySource].
@ProviderFor(allLandMarksBySource)
final allLandMarksBySourceProvider =
    AutoDisposeFutureProvider<Either<AppError, List<RouteLandMark>>>.internal(
  allLandMarksBySource,
  name: r'allLandMarksBySourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allLandMarksBySourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllLandMarksBySourceRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteLandMark>>>;
String _$allStopsBySourceHash() => r'c77d6f1ccd5f48311e83daa8eb76e73709baaf4e';

/// See also [allStopsBySource].
@ProviderFor(allStopsBySource)
final allStopsBySourceProvider =
    AutoDisposeFutureProvider<Either<AppError, List<RouteStop>>>.internal(
  allStopsBySource,
  name: r'allStopsBySourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allStopsBySourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllStopsBySourceRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteStop>>>;
String _$allStopsByRouteHash() => r'6c003cc3a27c63d7df9aa85c668df66b25294294';

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

/// See also [allStopsByRoute].
@ProviderFor(allStopsByRoute)
const allStopsByRouteProvider = AllStopsByRouteFamily();

/// See also [allStopsByRoute].
class AllStopsByRouteFamily
    extends Family<AsyncValue<Either<AppError, List<RouteStop>>>> {
  /// See also [allStopsByRoute].
  const AllStopsByRouteFamily();

  /// See also [allStopsByRoute].
  AllStopsByRouteProvider call({
    required Route route,
  }) {
    return AllStopsByRouteProvider(
      route: route,
    );
  }

  @override
  AllStopsByRouteProvider getProviderOverride(
    covariant AllStopsByRouteProvider provider,
  ) {
    return call(
      route: provider.route,
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
  String? get name => r'allStopsByRouteProvider';
}

/// See also [allStopsByRoute].
class AllStopsByRouteProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<RouteStop>>> {
  /// See also [allStopsByRoute].
  AllStopsByRouteProvider({
    required Route route,
  }) : this._internal(
          (ref) => allStopsByRoute(
            ref as AllStopsByRouteRef,
            route: route,
          ),
          from: allStopsByRouteProvider,
          name: r'allStopsByRouteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allStopsByRouteHash,
          dependencies: AllStopsByRouteFamily._dependencies,
          allTransitiveDependencies:
              AllStopsByRouteFamily._allTransitiveDependencies,
          route: route,
        );

  AllStopsByRouteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.route,
  }) : super.internal();

  final Route route;

  @override
  Override overrideWith(
    FutureOr<Either<AppError, List<RouteStop>>> Function(
            AllStopsByRouteRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllStopsByRouteProvider._internal(
        (ref) => create(ref as AllStopsByRouteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        route: route,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<AppError, List<RouteStop>>>
      createElement() {
    return _AllStopsByRouteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllStopsByRouteProvider && other.route == route;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, route.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AllStopsByRouteRef
    on AutoDisposeFutureProviderRef<Either<AppError, List<RouteStop>>> {
  /// The parameter `route` of this provider.
  Route get route;
}

class _AllStopsByRouteProviderElement
    extends AutoDisposeFutureProviderElement<Either<AppError, List<RouteStop>>>
    with AllStopsByRouteRef {
  _AllStopsByRouteProviderElement(super.provider);

  @override
  Route get route => (origin as AllStopsByRouteProvider).route;
}

String _$allLandmarksByRouteHash() =>
    r'5149e802b9bccf2e598f3753de300cf766505866';

/// See also [allLandmarksByRoute].
@ProviderFor(allLandmarksByRoute)
const allLandmarksByRouteProvider = AllLandmarksByRouteFamily();

/// See also [allLandmarksByRoute].
class AllLandmarksByRouteFamily
    extends Family<AsyncValue<Either<AppError, List<RouteLandMark>>>> {
  /// See also [allLandmarksByRoute].
  const AllLandmarksByRouteFamily();

  /// See also [allLandmarksByRoute].
  AllLandmarksByRouteProvider call({
    required TransportationProvider transProvider,
    required Route route,
  }) {
    return AllLandmarksByRouteProvider(
      transProvider: transProvider,
      route: route,
    );
  }

  @override
  AllLandmarksByRouteProvider getProviderOverride(
    covariant AllLandmarksByRouteProvider provider,
  ) {
    return call(
      transProvider: provider.transProvider,
      route: provider.route,
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
  String? get name => r'allLandmarksByRouteProvider';
}

/// See also [allLandmarksByRoute].
class AllLandmarksByRouteProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<RouteLandMark>>> {
  /// See also [allLandmarksByRoute].
  AllLandmarksByRouteProvider({
    required TransportationProvider transProvider,
    required Route route,
  }) : this._internal(
          (ref) => allLandmarksByRoute(
            ref as AllLandmarksByRouteRef,
            transProvider: transProvider,
            route: route,
          ),
          from: allLandmarksByRouteProvider,
          name: r'allLandmarksByRouteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allLandmarksByRouteHash,
          dependencies: AllLandmarksByRouteFamily._dependencies,
          allTransitiveDependencies:
              AllLandmarksByRouteFamily._allTransitiveDependencies,
          transProvider: transProvider,
          route: route,
        );

  AllLandmarksByRouteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.transProvider,
    required this.route,
  }) : super.internal();

  final TransportationProvider transProvider;
  final Route route;

  @override
  Override overrideWith(
    FutureOr<Either<AppError, List<RouteLandMark>>> Function(
            AllLandmarksByRouteRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllLandmarksByRouteProvider._internal(
        (ref) => create(ref as AllLandmarksByRouteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        transProvider: transProvider,
        route: route,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<AppError, List<RouteLandMark>>>
      createElement() {
    return _AllLandmarksByRouteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllLandmarksByRouteProvider &&
        other.transProvider == transProvider &&
        other.route == route;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, transProvider.hashCode);
    hash = _SystemHash.combine(hash, route.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AllLandmarksByRouteRef
    on AutoDisposeFutureProviderRef<Either<AppError, List<RouteLandMark>>> {
  /// The parameter `transProvider` of this provider.
  TransportationProvider get transProvider;

  /// The parameter `route` of this provider.
  Route get route;
}

class _AllLandmarksByRouteProviderElement
    extends AutoDisposeFutureProviderElement<
        Either<AppError, List<RouteLandMark>>> with AllLandmarksByRouteRef {
  _AllLandmarksByRouteProviderElement(super.provider);

  @override
  TransportationProvider get transProvider =>
      (origin as AllLandmarksByRouteProvider).transProvider;
  @override
  Route get route => (origin as AllLandmarksByRouteProvider).route;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
