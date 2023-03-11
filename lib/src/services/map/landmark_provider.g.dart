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

String _$landMarkServiceHash() => r'72f98be8b49d9b8304dccdb36850311de25b5f1d';

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
    r'a61fac65f5a0f4de51c95499cf9303f310bef9ac';

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
