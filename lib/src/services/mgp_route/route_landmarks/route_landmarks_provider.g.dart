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

String _$routeLandmarksHash() => r'3c5465d01f4b6c6f77ade4e820db0431eec75835';

/// See also [routeLandmarks].
final routeLandmarksProvider = Provider<RouteLandMarks>(
  routeLandmarks,
  name: r'routeLandmarksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routeLandmarksHash,
);
typedef RouteLandmarksRef = ProviderRef<RouteLandMarks>;
String _$routeLandMarksByIdHash() =>
    r'396de8471f400d21d65cd92377a1f7d0901ec375';

/// See also [routeLandMarksById].
class RouteLandMarksByIdProvider
    extends FutureProvider<Either<AppError, List<RouteLandMark>>> {
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
    = FutureProviderRef<Either<AppError, List<RouteLandMark>>>;

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
  FutureProvider<Either<AppError, List<RouteLandMark>>> getProviderOverride(
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
