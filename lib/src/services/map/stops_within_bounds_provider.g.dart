// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stops_within_bounds_provider.dart';

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

String _$stopsWithinMapBoundsHash() =>
    r'44baf688da97fe5af5dd595ed17e2a41587f9e0e';

/// See also [stopsWithinMapBounds].
class StopsWithinMapBoundsProvider
    extends AutoDisposeProvider<Stream<Either<AppError, List<RouteStop>>>> {
  StopsWithinMapBoundsProvider({
    required this.provider,
  }) : super(
          (ref) => stopsWithinMapBounds(
            ref,
            provider: provider,
          ),
          from: stopsWithinMapBoundsProvider,
          name: r'stopsWithinMapBoundsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stopsWithinMapBoundsHash,
        );

  final TransportationProvider provider;

  @override
  bool operator ==(Object other) {
    return other is StopsWithinMapBoundsProvider && other.provider == provider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, provider.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef StopsWithinMapBoundsRef
    = AutoDisposeProviderRef<Stream<Either<AppError, List<RouteStop>>>>;

/// See also [stopsWithinMapBounds].
final stopsWithinMapBoundsProvider = StopsWithinMapBoundsFamily();

class StopsWithinMapBoundsFamily
    extends Family<Stream<Either<AppError, List<RouteStop>>>> {
  StopsWithinMapBoundsFamily();

  StopsWithinMapBoundsProvider call({
    required TransportationProvider provider,
  }) {
    return StopsWithinMapBoundsProvider(
      provider: provider,
    );
  }

  @override
  AutoDisposeProvider<Stream<Either<AppError, List<RouteStop>>>>
      getProviderOverride(
    covariant StopsWithinMapBoundsProvider provider,
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
  String? get name => r'stopsWithinMapBoundsProvider';
}
