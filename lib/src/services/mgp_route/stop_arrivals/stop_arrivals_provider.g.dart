// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_arrivals_provider.dart';

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

String _$stopArrivalsHash() => r'59ea54183cfd3fa613f967c4c3e1250aeb6bccf4';

/// See also [stopArrivals].
final stopArrivalsProvider = AutoDisposeProvider<StopArrivalService>(
  stopArrivals,
  name: r'stopArrivalsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$stopArrivalsHash,
);
typedef StopArrivalsRef = AutoDisposeProviderRef<StopArrivalService>;
String _$arrivalsByStopHash() => r'92d5c6487e7e341e4f8dd3a625208c98a057321a';

/// See also [arrivalsByStop].
class ArrivalsByStopProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<StopArrival>>> {
  ArrivalsByStopProvider({
    required this.stop,
  }) : super(
          (ref) => arrivalsByStop(
            ref,
            stop: stop,
          ),
          from: arrivalsByStopProvider,
          name: r'arrivalsByStopProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$arrivalsByStopHash,
        );

  final RouteStop stop;

  @override
  bool operator ==(Object other) {
    return other is ArrivalsByStopProvider && other.stop == stop;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stop.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ArrivalsByStopRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<StopArrival>>>;

/// See also [arrivalsByStop].
final arrivalsByStopProvider = ArrivalsByStopFamily();

class ArrivalsByStopFamily
    extends Family<AsyncValue<Either<AppError, List<StopArrival>>>> {
  ArrivalsByStopFamily();

  ArrivalsByStopProvider call({
    required RouteStop stop,
  }) {
    return ArrivalsByStopProvider(
      stop: stop,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<StopArrival>>>
      getProviderOverride(
    covariant ArrivalsByStopProvider provider,
  ) {
    return call(
      stop: provider.stop,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'arrivalsByStopProvider';
}

String _$arrivalsByMarkerHash() => r'19e3f39304f4628ad56131474f28f8099112e99b';

/// See also [arrivalsByMarker].
class ArrivalsByMarkerProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<StopArrival>>> {
  ArrivalsByMarkerProvider({
    required this.marker,
  }) : super(
          (ref) => arrivalsByMarker(
            ref,
            marker: marker,
          ),
          from: arrivalsByMarkerProvider,
          name: r'arrivalsByMarkerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$arrivalsByMarkerHash,
        );

  final StopMarker marker;

  @override
  bool operator ==(Object other) {
    return other is ArrivalsByMarkerProvider && other.marker == marker;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, marker.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ArrivalsByMarkerRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<StopArrival>>>;

/// See also [arrivalsByMarker].
final arrivalsByMarkerProvider = ArrivalsByMarkerFamily();

class ArrivalsByMarkerFamily
    extends Family<AsyncValue<Either<AppError, List<StopArrival>>>> {
  ArrivalsByMarkerFamily();

  ArrivalsByMarkerProvider call({
    required StopMarker marker,
  }) {
    return ArrivalsByMarkerProvider(
      marker: marker,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<StopArrival>>>
      getProviderOverride(
    covariant ArrivalsByMarkerProvider provider,
  ) {
    return call(
      marker: provider.marker,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'arrivalsByMarkerProvider';
}
