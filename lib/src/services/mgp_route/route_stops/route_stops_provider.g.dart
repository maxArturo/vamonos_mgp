// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stops_provider.dart';

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

String _$routeStopsHash() => r'338ac918bfd6720a611542b14faf124ae7ecfc9e';

/// See also [routeStops].
final routeStopsProvider = AutoDisposeProvider<RouteStopService>(
  routeStops,
  name: r'routeStopsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routeStopsHash,
);
typedef RouteStopsRef = AutoDisposeProviderRef<RouteStopService>;
String _$routeStopsByRouteHash() => r'78e517ee8800c5c5f990ec99c063e47e54996963';

/// See also [routeStopsByRoute].
class RouteStopsByRouteProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<RouteStop>>> {
  RouteStopsByRouteProvider({
    required this.route,
  }) : super(
          (ref) => routeStopsByRoute(
            ref,
            route: route,
          ),
          from: routeStopsByRouteProvider,
          name: r'routeStopsByRouteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$routeStopsByRouteHash,
        );

  final Route route;

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

typedef RouteStopsByRouteRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteStop>>>;

/// See also [routeStopsByRoute].
final routeStopsByRouteProvider = RouteStopsByRouteFamily();

class RouteStopsByRouteFamily
    extends Family<AsyncValue<Either<AppError, List<RouteStop>>>> {
  RouteStopsByRouteFamily();

  RouteStopsByRouteProvider call({
    required Route route,
  }) {
    return RouteStopsByRouteProvider(
      route: route,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<RouteStop>>>
      getProviderOverride(
    covariant RouteStopsByRouteProvider provider,
  ) {
    return call(
      route: provider.route,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'routeStopsByRouteProvider';
}
