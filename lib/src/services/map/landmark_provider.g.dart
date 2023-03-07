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

String _$landMarkServiceHash() => r'2ef985c3d010ab210f2667f61c66079dbb951c41';

/// See also [landMarkService].
final landMarkServiceProvider = AutoDisposeProvider<LandmarkService>(
  landMarkService,
  name: r'landMarkServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$landMarkServiceHash,
);
typedef LandMarkServiceRef = AutoDisposeProviderRef<LandmarkService>;
String _$allLandMarksByProviderHash() =>
    r'd9a48df564fa4bd5f4ef626ccf9bc071fb14efa4';

/// See also [allLandMarksByProvider].
class AllLandMarksByProviderProvider extends AutoDisposeFutureProvider<
    Either<AppError, List<RouteStopLandMark>>> {
  AllLandMarksByProviderProvider({
    required this.provider,
  }) : super(
          (ref) => allLandMarksByProvider(
            ref,
            provider: provider,
          ),
          from: allLandMarksByProviderProvider,
          name: r'allLandMarksByProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allLandMarksByProviderHash,
        );

  final TransportationProvider provider;

  @override
  bool operator ==(Object other) {
    return other is AllLandMarksByProviderProvider &&
        other.provider == provider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, provider.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef AllLandMarksByProviderRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteStopLandMark>>>;

/// See also [allLandMarksByProvider].
final allLandMarksByProviderProvider = AllLandMarksByProviderFamily();

class AllLandMarksByProviderFamily
    extends Family<AsyncValue<Either<AppError, List<RouteStopLandMark>>>> {
  AllLandMarksByProviderFamily();

  AllLandMarksByProviderProvider call({
    required TransportationProvider provider,
  }) {
    return AllLandMarksByProviderProvider(
      provider: provider,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<RouteStopLandMark>>>
      getProviderOverride(
    covariant AllLandMarksByProviderProvider provider,
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
  String? get name => r'allLandMarksByProviderProvider';
}
