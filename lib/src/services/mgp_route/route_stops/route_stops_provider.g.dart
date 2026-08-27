// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stops_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routeStopsHash() => r'bf8b0746e48053b555186e889221588c1730a059';

/// See also [routeStops].
@ProviderFor(routeStops)
final routeStopsProvider = AutoDisposeProvider<RouteStopService>.internal(
  routeStops,
  name: r'routeStopsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routeStopsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouteStopsRef = AutoDisposeProviderRef<RouteStopService>;
String _$routeStopsByRouteHash() => r'78e517ee8800c5c5f990ec99c063e47e54996963';

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

/// See also [routeStopsByRoute].
@ProviderFor(routeStopsByRoute)
const routeStopsByRouteProvider = RouteStopsByRouteFamily();

/// See also [routeStopsByRoute].
class RouteStopsByRouteFamily
    extends Family<AsyncValue<Either<AppError, List<RouteStop>>>> {
  /// See also [routeStopsByRoute].
  const RouteStopsByRouteFamily();

  /// See also [routeStopsByRoute].
  RouteStopsByRouteProvider call({
    required Route route,
  }) {
    return RouteStopsByRouteProvider(
      route: route,
    );
  }

  @override
  RouteStopsByRouteProvider getProviderOverride(
    covariant RouteStopsByRouteProvider provider,
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
  String? get name => r'routeStopsByRouteProvider';
}

/// See also [routeStopsByRoute].
class RouteStopsByRouteProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<RouteStop>>> {
  /// See also [routeStopsByRoute].
  RouteStopsByRouteProvider({
    required Route route,
  }) : this._internal(
          (ref) => routeStopsByRoute(
            ref as RouteStopsByRouteRef,
            route: route,
          ),
          from: routeStopsByRouteProvider,
          name: r'routeStopsByRouteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$routeStopsByRouteHash,
          dependencies: RouteStopsByRouteFamily._dependencies,
          allTransitiveDependencies:
              RouteStopsByRouteFamily._allTransitiveDependencies,
          route: route,
        );

  RouteStopsByRouteProvider._internal(
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
            RouteStopsByRouteRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RouteStopsByRouteProvider._internal(
        (ref) => create(ref as RouteStopsByRouteRef),
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
    return _RouteStopsByRouteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RouteStopsByRouteProvider && other.route == route;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, route.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RouteStopsByRouteRef
    on AutoDisposeFutureProviderRef<Either<AppError, List<RouteStop>>> {
  /// The parameter `route` of this provider.
  Route get route;
}

class _RouteStopsByRouteProviderElement
    extends AutoDisposeFutureProviderElement<Either<AppError, List<RouteStop>>>
    with RouteStopsByRouteRef {
  _RouteStopsByRouteProviderElement(super.provider);

  @override
  Route get route => (origin as RouteStopsByRouteProvider).route;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
