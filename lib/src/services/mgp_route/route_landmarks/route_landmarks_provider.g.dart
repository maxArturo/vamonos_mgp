// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_landmarks_provider.dart';

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

String _$routeLandmarksHash() => r'9faf2fe47cf12c1322101e92f26d24d0a017db16';

/// See also [routeLandmarks].
final routeLandmarksProvider = AutoDisposeProvider<RouteLandMarks>(
  routeLandmarks,
  name: r'routeLandmarksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routeLandmarksHash,
);
typedef RouteLandmarksRef = AutoDisposeProviderRef<RouteLandMarks>;
String _$routeLandMarksByIdHash() =>
    r'09ab1737e062e226d0ce74130a92c30f2aea949f';

/// See also [routeLandMarksById].
class RouteLandMarksByIdProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<RouteLandMark>>> {
  RouteLandMarksByIdProvider({
    required this.route,
  }) : super(
          (ref) => routeLandMarksById(
            ref,
            route: route,
          ),
          from: routeLandMarksByIdProvider,
          name: r'routeLandMarksByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$routeLandMarksByIdHash,
        );

  final Route route;

  @override
  bool operator ==(Object other) {
    return other is RouteLandMarksByIdProvider && other.route == route;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, route.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef RouteLandMarksByIdRef
    = AutoDisposeFutureProviderRef<Either<AppError, List<RouteLandMark>>>;

/// See also [routeLandMarksById].
final routeLandMarksByIdProvider = RouteLandMarksByIdFamily();

class RouteLandMarksByIdFamily
    extends Family<AsyncValue<Either<AppError, List<RouteLandMark>>>> {
  RouteLandMarksByIdFamily();

  RouteLandMarksByIdProvider call({
    required Route route,
  }) {
    return RouteLandMarksByIdProvider(
      route: route,
    );
  }

  @override
  AutoDisposeFutureProvider<Either<AppError, List<RouteLandMark>>>
      getProviderOverride(
    covariant RouteLandMarksByIdProvider provider,
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
  String? get name => r'routeLandMarksByIdProvider';
}
