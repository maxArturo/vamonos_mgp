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

String _$landMarkServiceHash() => r'2ef2b8ba04f215cfdbabe485896a84ecb320ae5d';

/// See also [landMarkService].
final landMarkServiceProvider = AutoDisposeProvider<LandmarkService>(
  landMarkService,
  name: r'landMarkServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$landMarkServiceHash,
);
typedef LandMarkServiceRef = AutoDisposeProviderRef<LandmarkService>;
String _$allLandMarksHash() => r'6505ff46beda5c7420a668bce6c7f67dec785c48';

/// See also [allLandMarks].
class AllLandMarksProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<RouteLandMark>>> {
  AllLandMarksProvider({
    required this.provider,
  }) : super(
          (ref) => allLandMarks(
            ref,
            provider: provider,
          ),
          from: allLandMarksProvider,
          name: r'allLandMarksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allLandMarksHash,
        );

  final TransportationProvider provider;

  @override
  bool operator ==(Object other) {
    return other is AllLandMarksProvider && other.provider == provider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, provider.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef AllLandMarksRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteLandMark>>>;

/// See also [allLandMarks].
final allLandMarksProvider = AllLandMarksFamily();

class AllLandMarksFamily
    extends Family<AsyncValue<Either<AppError, List<RouteLandMark>>>> {
  AllLandMarksFamily();

  AllLandMarksProvider call({
    required TransportationProvider provider,
  }) {
    return AllLandMarksProvider(
      provider: provider,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<RouteLandMark>>>
      getProviderOverride(
    covariant AllLandMarksProvider provider,
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
  String? get name => r'allLandMarksProvider';
}

String _$allStopsHash() => r'd3d3e2e859925660a7122cd5468294d328376e55';

/// See also [allStops].
class AllStopsProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<RouteStop>>> {
  AllStopsProvider({
    required this.provider,
  }) : super(
          (ref) => allStops(
            ref,
            provider: provider,
          ),
          from: allStopsProvider,
          name: r'allStopsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allStopsHash,
        );

  final TransportationProvider provider;

  @override
  bool operator ==(Object other) {
    return other is AllStopsProvider && other.provider == provider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, provider.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef AllStopsRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteStop>>>;

/// See also [allStops].
final allStopsProvider = AllStopsFamily();

class AllStopsFamily
    extends Family<AsyncValue<Either<AppError, List<RouteStop>>>> {
  AllStopsFamily();

  AllStopsProvider call({
    required TransportationProvider provider,
  }) {
    return AllStopsProvider(
      provider: provider,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<RouteStop>>>
      getProviderOverride(
    covariant AllStopsProvider provider,
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
  String? get name => r'allStopsProvider';
}

String _$stopsStoreBySourceHash() =>
    r'39f912a3f0776aaec03960bfa9996e7de1d8b2b2';

/// See also [stopsStoreBySource].
class StopsStoreBySourceProvider
    extends AutoDisposeFutureProvider<Either<AppError, Map<int, RouteStop>>> {
  StopsStoreBySourceProvider({
    required this.provider,
  }) : super(
          (ref) => stopsStoreBySource(
            ref,
            provider: provider,
          ),
          from: stopsStoreBySourceProvider,
          name: r'stopsStoreBySourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stopsStoreBySourceHash,
        );

  final TransportationProvider provider;

  @override
  bool operator ==(Object other) {
    return other is StopsStoreBySourceProvider && other.provider == provider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, provider.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef StopsStoreBySourceRef
    = AutoDisposeFutureProviderRef<Either<AppError, Map<int, RouteStop>>>;

/// See also [stopsStoreBySource].
final stopsStoreBySourceProvider = StopsStoreBySourceFamily();

class StopsStoreBySourceFamily
    extends Family<AsyncValue<Either<AppError, Map<int, RouteStop>>>> {
  StopsStoreBySourceFamily();

  StopsStoreBySourceProvider call({
    required TransportationProvider provider,
  }) {
    return StopsStoreBySourceProvider(
      provider: provider,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, Map<int, RouteStop>>>
      getProviderOverride(
    covariant StopsStoreBySourceProvider provider,
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
  String? get name => r'stopsStoreBySourceProvider';
}

String _$stopsStoreByRouteHash() => r'7eb92aad69b4213c5651258bf97c0002925e50fb';

/// See also [stopsStoreByRoute].
class StopsStoreByRouteProvider
    extends AutoDisposeFutureProvider<Either<AppError, Map<int, RouteStop>>> {
  StopsStoreByRouteProvider({
    required this.provider,
    required this.route,
  }) : super(
          (ref) => stopsStoreByRoute(
            ref,
            provider: provider,
            route: route,
          ),
          from: stopsStoreByRouteProvider,
          name: r'stopsStoreByRouteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stopsStoreByRouteHash,
        );

  final TransportationProvider provider;
  final Route route;

  @override
  bool operator ==(Object other) {
    return other is StopsStoreByRouteProvider &&
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

typedef StopsStoreByRouteRef
    = AutoDisposeFutureProviderRef<Either<AppError, Map<int, RouteStop>>>;

/// See also [stopsStoreByRoute].
final stopsStoreByRouteProvider = StopsStoreByRouteFamily();

class StopsStoreByRouteFamily
    extends Family<AsyncValue<Either<AppError, Map<int, RouteStop>>>> {
  StopsStoreByRouteFamily();

  StopsStoreByRouteProvider call({
    required TransportationProvider provider,
    required Route route,
  }) {
    return StopsStoreByRouteProvider(
      provider: provider,
      route: route,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, Map<int, RouteStop>>>
      getProviderOverride(
    covariant StopsStoreByRouteProvider provider,
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
  String? get name => r'stopsStoreByRouteProvider';
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
