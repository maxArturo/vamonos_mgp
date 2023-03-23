// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directed_route_landmarks_provider.dart';

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

String _$directedRouteVisibleLandmarksHash() =>
    r'86618b02c6159cf30408f8628f344c191163d3ff';

/// See also [directedRouteVisibleLandmarks].
class DirectedRouteVisibleLandmarksProvider
    extends AutoDisposeProvider<Stream<Either<AppError, List<RouteLandMark>>>> {
  DirectedRouteVisibleLandmarksProvider({
    required this.directedRoute,
  }) : super(
          (ref) => directedRouteVisibleLandmarks(
            ref,
            directedRoute: directedRoute,
          ),
          from: directedRouteVisibleLandmarksProvider,
          name: r'directedRouteVisibleLandmarksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$directedRouteVisibleLandmarksHash,
        );

  final DirectedRoute directedRoute;

  @override
  bool operator ==(Object other) {
    return other is DirectedRouteVisibleLandmarksProvider &&
        other.directedRoute == directedRoute;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, directedRoute.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef DirectedRouteVisibleLandmarksRef
    = AutoDisposeProviderRef<Stream<Either<AppError, List<RouteLandMark>>>>;

/// See also [directedRouteVisibleLandmarks].
final directedRouteVisibleLandmarksProvider =
    DirectedRouteVisibleLandmarksFamily();

class DirectedRouteVisibleLandmarksFamily
    extends Family<Stream<Either<AppError, List<RouteLandMark>>>> {
  DirectedRouteVisibleLandmarksFamily();

  DirectedRouteVisibleLandmarksProvider call({
    required DirectedRoute directedRoute,
  }) {
    return DirectedRouteVisibleLandmarksProvider(
      directedRoute: directedRoute,
    );
  }

  @override
  AutoDisposeProvider<Stream<Either<AppError, List<RouteLandMark>>>>
      getProviderOverride(
    covariant DirectedRouteVisibleLandmarksProvider provider,
  ) {
    return call(
      directedRoute: provider.directedRoute,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'directedRouteVisibleLandmarksProvider';
}
