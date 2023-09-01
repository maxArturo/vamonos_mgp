// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stop_provider.dart';

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

String _$findRouteStopByMarkerMGPHash() =>
    r'3db8d7f16962383560c35f9915f7b5f4377b6aed';

/// See also [findRouteStopByMarkerMGP].
class FindRouteStopByMarkerMGPProvider
    extends AutoDisposeFutureProvider<Either<AppError, RouteStop>> {
  FindRouteStopByMarkerMGPProvider(
    this.marker,
  ) : super(
          (ref) => findRouteStopByMarkerMGP(
            ref,
            marker,
          ),
          from: findRouteStopByMarkerMGPProvider,
          name: r'findRouteStopByMarkerMGPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findRouteStopByMarkerMGPHash,
        );

  final StopMarker marker;

  @override
  bool operator ==(Object other) {
    return other is FindRouteStopByMarkerMGPProvider && other.marker == marker;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, marker.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FindRouteStopByMarkerMGPRef
    = AutoDisposeFutureProviderRef<Either<AppError, RouteStop>>;

/// See also [findRouteStopByMarkerMGP].
final findRouteStopByMarkerMGPProvider = FindRouteStopByMarkerMGPFamily();

class FindRouteStopByMarkerMGPFamily
    extends Family<AsyncValue<Either<AppError, RouteStop>>> {
  FindRouteStopByMarkerMGPFamily();

  FindRouteStopByMarkerMGPProvider call(
    StopMarker marker,
  ) {
    return FindRouteStopByMarkerMGPProvider(
      marker,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, RouteStop>> getProviderOverride(
    covariant FindRouteStopByMarkerMGPProvider provider,
  ) {
    return call(
      provider.marker,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'findRouteStopByMarkerMGPProvider';
}
