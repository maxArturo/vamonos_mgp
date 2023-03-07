// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stop_landmarks_provider.dart';

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

String _$routeStopLandmarksHash() =>
    r'585e7df0938c66bef846ad0c2c6fe155af04b178';

/// See also [routeStopLandmarks].
final routeStopLandmarksProvider = AutoDisposeProvider<RouteStopLandMarks>(
  routeStopLandmarks,
  name: r'routeStopLandmarksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routeStopLandmarksHash,
);
typedef RouteStopLandmarksRef = AutoDisposeProviderRef<RouteStopLandMarks>;
String _$routeStopLandMarksByIdHash() =>
    r'c5e2470b3f0a5618c0ca70092a6379ac42ee6c5c';

/// See also [routeStopLandMarksById].
class RouteStopLandMarksByIdProvider extends AutoDisposeFutureProvider<
    Either<AppError, List<RouteStopLandMark>>> {
  RouteStopLandMarksByIdProvider({
    required this.route,
  }) : super(
          (ref) => routeStopLandMarksById(
            ref,
            route: route,
          ),
          from: routeStopLandMarksByIdProvider,
          name: r'routeStopLandMarksByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$routeStopLandMarksByIdHash,
        );

  final Route route;

  @override
  bool operator ==(Object other) {
    return other is RouteStopLandMarksByIdProvider && other.route == route;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, route.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef RouteStopLandMarksByIdRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteStopLandMark>>>;

/// See also [routeStopLandMarksById].
final routeStopLandMarksByIdProvider = RouteStopLandMarksByIdFamily();

class RouteStopLandMarksByIdFamily
    extends Family<AsyncValue<Either<AppError, List<RouteStopLandMark>>>> {
  RouteStopLandMarksByIdFamily();

  RouteStopLandMarksByIdProvider call({
    required Route route,
  }) {
    return RouteStopLandMarksByIdProvider(
      route: route,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<RouteStopLandMark>>>
      getProviderOverride(
    covariant RouteStopLandMarksByIdProvider provider,
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
  String? get name => r'routeStopLandMarksByIdProvider';
}
