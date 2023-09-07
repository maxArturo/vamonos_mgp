// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_landmarks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routeLandmarksHash() => r'3c5465d01f4b6c6f77ade4e820db0431eec75835';

/// See also [routeLandmarks].
@ProviderFor(routeLandmarks)
final routeLandmarksProvider = Provider<RouteLandMarks>.internal(
  routeLandmarks,
  name: r'routeLandmarksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routeLandmarksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouteLandmarksRef = ProviderRef<RouteLandMarks>;
String _$routeLandMarksByIdHash() =>
    r'396de8471f400d21d65cd92377a1f7d0901ec375';

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

/// See also [routeLandMarksById].
@ProviderFor(routeLandMarksById)
const routeLandMarksByIdProvider = RouteLandMarksByIdFamily();

/// See also [routeLandMarksById].
class RouteLandMarksByIdFamily
    extends Family<AsyncValue<Either<AppError, List<RouteLandMark>>>> {
  /// See also [routeLandMarksById].
  const RouteLandMarksByIdFamily();

  /// See also [routeLandMarksById].
  RouteLandMarksByIdProvider call({
    required Route route,
  }) {
    return RouteLandMarksByIdProvider(
      route: route,
    );
  }

  @override
  RouteLandMarksByIdProvider getProviderOverride(
    covariant RouteLandMarksByIdProvider provider,
  ) {
    return call(
      route: provider.route,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'routeLandMarksByIdProvider';
}

/// See also [routeLandMarksById].
class RouteLandMarksByIdProvider
    extends FutureProvider<Either<AppError, List<RouteLandMark>>> {
  /// See also [routeLandMarksById].
  RouteLandMarksByIdProvider({
    required Route route,
  }) : this._internal(
          (ref) => routeLandMarksById(
            ref as RouteLandMarksByIdRef,
            route: route,
          ),
          from: routeLandMarksByIdProvider,
          name: r'routeLandMarksByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$routeLandMarksByIdHash,
          dependencies: RouteLandMarksByIdFamily._dependencies,
          allTransitiveDependencies:
              RouteLandMarksByIdFamily._allTransitiveDependencies,
          route: route,
        );

  RouteLandMarksByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.route,
  }) : super.internal();

  final Route route;

  @override
  Override overrideWith(
    FutureOr<Either<AppError, List<RouteLandMark>>> Function(
            RouteLandMarksByIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RouteLandMarksByIdProvider._internal(
        (ref) => create(ref as RouteLandMarksByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        route: route,
      ),
    );
  }

  @override
  FutureProviderElement<Either<AppError, List<RouteLandMark>>> createElement() {
    return _RouteLandMarksByIdProviderElement(this);
  }

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

mixin RouteLandMarksByIdRef
    on FutureProviderRef<Either<AppError, List<RouteLandMark>>> {
  /// The parameter `route` of this provider.
  Route get route;
}

class _RouteLandMarksByIdProviderElement
    extends FutureProviderElement<Either<AppError, List<RouteLandMark>>>
    with RouteLandMarksByIdRef {
  _RouteLandMarksByIdProviderElement(super.provider);

  @override
  Route get route => (origin as RouteLandMarksByIdProvider).route;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
