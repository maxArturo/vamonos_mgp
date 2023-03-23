// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landmark_provider.dart';

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

String _$landMarkServiceHash() => r'4eb872352a6c604f8ade9ac0c5f0258687043c06';

/// See also [landMarkService].
final landMarkServiceProvider = AutoDisposeProvider<LandmarkService>(
  landMarkService,
  name: r'landMarkServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$landMarkServiceHash,
);
typedef LandMarkServiceRef = AutoDisposeProviderRef<LandmarkService>;
String _$allLandMarksBySourceHash() =>
    r'59c80406f80767a78ab373bc651bc64c4235919e';

/// See also [allLandMarksBySource].
class AllLandMarksBySourceProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<RouteLandMark>>> {
  AllLandMarksBySourceProvider({
    required this.provider,
  }) : super(
          (ref) => allLandMarksBySource(
            ref,
            provider: provider,
          ),
          from: allLandMarksBySourceProvider,
          name: r'allLandMarksBySourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allLandMarksBySourceHash,
        );

  final TransportationProvider provider;

  @override
  bool operator ==(Object other) {
    return other is AllLandMarksBySourceProvider && other.provider == provider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, provider.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef AllLandMarksBySourceRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteLandMark>>>;

/// See also [allLandMarksBySource].
final allLandMarksBySourceProvider = AllLandMarksBySourceFamily();

class AllLandMarksBySourceFamily
    extends Family<AsyncValue<Either<AppError, List<RouteLandMark>>>> {
  AllLandMarksBySourceFamily();

  AllLandMarksBySourceProvider call({
    required TransportationProvider provider,
  }) {
    return AllLandMarksBySourceProvider(
      provider: provider,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<RouteLandMark>>>
      getProviderOverride(
    covariant AllLandMarksBySourceProvider provider,
  ) {
    return call(
      provider: provider.provider,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'allLandMarksBySourceProvider';
}

String _$allStopsBySourceHash() => r'158d301ffe3bccf1bcddf7b7e038cf89209f66f2';

/// See also [allStopsBySource].
class AllStopsBySourceProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<RouteStop>>> {
  AllStopsBySourceProvider({
    required this.provider,
  }) : super(
          (ref) => allStopsBySource(
            ref,
            provider: provider,
          ),
          from: allStopsBySourceProvider,
          name: r'allStopsBySourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allStopsBySourceHash,
        );

  final TransportationProvider provider;

  @override
  bool operator ==(Object other) {
    return other is AllStopsBySourceProvider && other.provider == provider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, provider.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef AllStopsBySourceRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteStop>>>;

/// See also [allStopsBySource].
final allStopsBySourceProvider = AllStopsBySourceFamily();

class AllStopsBySourceFamily
    extends Family<AsyncValue<Either<AppError, List<RouteStop>>>> {
  AllStopsBySourceFamily();

  AllStopsBySourceProvider call({
    required TransportationProvider provider,
  }) {
    return AllStopsBySourceProvider(
      provider: provider,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<RouteStop>>>
      getProviderOverride(
    covariant AllStopsBySourceProvider provider,
  ) {
    return call(
      provider: provider.provider,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'allStopsBySourceProvider';
}

String _$allStopsByRouteHash() => r'671b396277788c9ff706b991adcd52b659209220';

/// See also [allStopsByRoute].
class AllStopsByRouteProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<RouteStop>>> {
  AllStopsByRouteProvider({
    required this.provider,
    required this.route,
  }) : super(
          (ref) => allStopsByRoute(
            ref,
            provider: provider,
            route: route,
          ),
          from: allStopsByRouteProvider,
          name: r'allStopsByRouteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allStopsByRouteHash,
        );

  final TransportationProvider provider;
  final Route route;

  @override
  bool operator ==(Object other) {
    return other is AllStopsByRouteProvider &&
        other.provider == provider &&
        other.route == route;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, provider.hashCode);
    hash = _SystemHash.combine(hash, route.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef AllStopsByRouteRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteStop>>>;

/// See also [allStopsByRoute].
final allStopsByRouteProvider = AllStopsByRouteFamily();

class AllStopsByRouteFamily
    extends Family<AsyncValue<Either<AppError, List<RouteStop>>>> {
  AllStopsByRouteFamily();

  AllStopsByRouteProvider call({
    required TransportationProvider provider,
    required Route route,
  }) {
    return AllStopsByRouteProvider(
      provider: provider,
      route: route,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<RouteStop>>>
      getProviderOverride(
    covariant AllStopsByRouteProvider provider,
  ) {
    return call(
      provider: provider.provider,
      route: provider.route,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'allStopsByRouteProvider';
}

String _$allLandmarksByRouteHash() =>
    r'efe380359269f50d9b2e31a6fca0e0e60f756531';

/// See also [allLandmarksByRoute].
class AllLandmarksByRouteProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<RouteLandMark>>> {
  AllLandmarksByRouteProvider({
    required this.provider,
    required this.route,
  }) : super(
          (ref) => allLandmarksByRoute(
            ref,
            provider: provider,
            route: route,
          ),
          from: allLandmarksByRouteProvider,
          name: r'allLandmarksByRouteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allLandmarksByRouteHash,
        );

  final TransportationProvider provider;
  final Route route;

  @override
  bool operator ==(Object other) {
    return other is AllLandmarksByRouteProvider &&
        other.provider == provider &&
        other.route == route;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, provider.hashCode);
    hash = _SystemHash.combine(hash, route.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef AllLandmarksByRouteRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteLandMark>>>;

/// See also [allLandmarksByRoute].
final allLandmarksByRouteProvider = AllLandmarksByRouteFamily();

class AllLandmarksByRouteFamily
    extends Family<AsyncValue<Either<AppError, List<RouteLandMark>>>> {
  AllLandmarksByRouteFamily();

  AllLandmarksByRouteProvider call({
    required TransportationProvider provider,
    required Route route,
  }) {
    return AllLandmarksByRouteProvider(
      provider: provider,
      route: route,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<RouteLandMark>>>
      getProviderOverride(
    covariant AllLandmarksByRouteProvider provider,
  ) {
    return call(
      provider: provider.provider,
      route: provider.route,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'allLandmarksByRouteProvider';
}
