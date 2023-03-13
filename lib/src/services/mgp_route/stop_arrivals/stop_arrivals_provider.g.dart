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

String _$stopArrivalsHash() => r'ea8db77002a8cec7c6e102edd0771dd9aebaf1cc';

/// See also [stopArrivals].
final stopArrivalsProvider = AutoDisposeProvider<StopArrivalService>(
  stopArrivals,
  name: r'stopArrivalsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$stopArrivalsHash,
);
typedef StopArrivalsRef = AutoDisposeProviderRef<StopArrivalService>;
String _$stopArrivalsByStopHash() =>
    r'7c795cc6659ae6d065e11a7ae6559bbcfbfb740e';

/// See also [stopArrivalsByStop].
class StopArrivalsByStopProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<StopArrival>>> {
  StopArrivalsByStopProvider({
    required this.stop,
  }) : super(
          (ref) => stopArrivalsByStop(
            ref,
            stop: stop,
          ),
          from: stopArrivalsByStopProvider,
          name: r'stopArrivalsByStopProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stopArrivalsByStopHash,
        );

  final RouteStop stop;

  @override
  bool operator ==(Object other) {
    return other is StopArrivalsByStopProvider && other.stop == stop;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stop.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef StopArrivalsByStopRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<StopArrival>>>;

/// See also [stopArrivalsByStop].
final stopArrivalsByStopProvider = StopArrivalsByStopFamily();

class StopArrivalsByStopFamily
    extends Family<AsyncValue<Either<AppError, List<StopArrival>>>> {
  StopArrivalsByStopFamily();

  StopArrivalsByStopProvider call({
    required RouteStop stop,
  }) {
    return StopArrivalsByStopProvider(
      stop: stop,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<StopArrival>>>
      getProviderOverride(
    covariant StopArrivalsByStopProvider provider,
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
  String? get name => r'stopArrivalsByStopProvider';
}
