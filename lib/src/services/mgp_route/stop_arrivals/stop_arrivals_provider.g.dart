// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_arrivals_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stopArrivalsHash() => r'59ea54183cfd3fa613f967c4c3e1250aeb6bccf4';

/// See also [stopArrivals].
@ProviderFor(stopArrivals)
final stopArrivalsProvider = AutoDisposeProvider<StopArrivalService>.internal(
  stopArrivals,
  name: r'stopArrivalsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$stopArrivalsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StopArrivalsRef = AutoDisposeProviderRef<StopArrivalService>;
String _$stopArrivalsByStopHash() =>
    r'7c795cc6659ae6d065e11a7ae6559bbcfbfb740e';

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

/// See also [stopArrivalsByStop].
@ProviderFor(stopArrivalsByStop)
const stopArrivalsByStopProvider = StopArrivalsByStopFamily();

/// See also [stopArrivalsByStop].
class StopArrivalsByStopFamily
    extends Family<AsyncValue<Either<AppError, List<StopArrival>>>> {
  /// See also [stopArrivalsByStop].
  const StopArrivalsByStopFamily();

  /// See also [stopArrivalsByStop].
  StopArrivalsByStopProvider call({
    required RouteStop stop,
  }) {
    return StopArrivalsByStopProvider(
      stop: stop,
    );
  }

  @override
  StopArrivalsByStopProvider getProviderOverride(
    covariant StopArrivalsByStopProvider provider,
  ) {
    return call(
      stop: provider.stop,
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
  String? get name => r'stopArrivalsByStopProvider';
}

/// See also [stopArrivalsByStop].
class StopArrivalsByStopProvider
    extends AutoDisposeFutureProvider<Either<AppError, List<StopArrival>>> {
  /// See also [stopArrivalsByStop].
  StopArrivalsByStopProvider({
    required RouteStop stop,
  }) : this._internal(
          (ref) => stopArrivalsByStop(
            ref as StopArrivalsByStopRef,
            stop: stop,
          ),
          from: stopArrivalsByStopProvider,
          name: r'stopArrivalsByStopProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stopArrivalsByStopHash,
          dependencies: StopArrivalsByStopFamily._dependencies,
          allTransitiveDependencies:
              StopArrivalsByStopFamily._allTransitiveDependencies,
          stop: stop,
        );

  StopArrivalsByStopProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stop,
  }) : super.internal();

  final RouteStop stop;

  @override
  Override overrideWith(
    FutureOr<Either<AppError, List<StopArrival>>> Function(
            StopArrivalsByStopRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StopArrivalsByStopProvider._internal(
        (ref) => create(ref as StopArrivalsByStopRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stop: stop,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<AppError, List<StopArrival>>>
      createElement() {
    return _StopArrivalsByStopProviderElement(this);
  }

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

mixin StopArrivalsByStopRef
    on AutoDisposeFutureProviderRef<Either<AppError, List<StopArrival>>> {
  /// The parameter `stop` of this provider.
  RouteStop get stop;
}

class _StopArrivalsByStopProviderElement
    extends AutoDisposeFutureProviderElement<
        Either<AppError, List<StopArrival>>> with StopArrivalsByStopRef {
  _StopArrivalsByStopProviderElement(super.provider);

  @override
  RouteStop get stop => (origin as StopArrivalsByStopProvider).stop;
}

String _$stopArrivalsByMarkerHash() =>
    r'8f61bad23daaa4ad25ee3c3a226571321c1dc090';

/// See also [stopArrivalsByMarker].
@ProviderFor(stopArrivalsByMarker)
const stopArrivalsByMarkerProvider = StopArrivalsByMarkerFamily();

/// See also [stopArrivalsByMarker].
class StopArrivalsByMarkerFamily extends Family<
    AsyncValue<Either<AppError, Map<RouteStop, List<StopArrival>>>>> {
  /// See also [stopArrivalsByMarker].
  const StopArrivalsByMarkerFamily();

  /// See also [stopArrivalsByMarker].
  StopArrivalsByMarkerProvider call(
    StopMarker marker,
  ) {
    return StopArrivalsByMarkerProvider(
      marker,
    );
  }

  @override
  StopArrivalsByMarkerProvider getProviderOverride(
    covariant StopArrivalsByMarkerProvider provider,
  ) {
    return call(
      provider.marker,
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
  String? get name => r'stopArrivalsByMarkerProvider';
}

/// See also [stopArrivalsByMarker].
class StopArrivalsByMarkerProvider extends AutoDisposeFutureProvider<
    Either<AppError, Map<RouteStop, List<StopArrival>>>> {
  /// See also [stopArrivalsByMarker].
  StopArrivalsByMarkerProvider(
    StopMarker marker,
  ) : this._internal(
          (ref) => stopArrivalsByMarker(
            ref as StopArrivalsByMarkerRef,
            marker,
          ),
          from: stopArrivalsByMarkerProvider,
          name: r'stopArrivalsByMarkerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stopArrivalsByMarkerHash,
          dependencies: StopArrivalsByMarkerFamily._dependencies,
          allTransitiveDependencies:
              StopArrivalsByMarkerFamily._allTransitiveDependencies,
          marker: marker,
        );

  StopArrivalsByMarkerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.marker,
  }) : super.internal();

  final StopMarker marker;

  @override
  Override overrideWith(
    FutureOr<Either<AppError, Map<RouteStop, List<StopArrival>>>> Function(
            StopArrivalsByMarkerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StopArrivalsByMarkerProvider._internal(
        (ref) => create(ref as StopArrivalsByMarkerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        marker: marker,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<
      Either<AppError, Map<RouteStop, List<StopArrival>>>> createElement() {
    return _StopArrivalsByMarkerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StopArrivalsByMarkerProvider && other.marker == marker;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, marker.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StopArrivalsByMarkerRef on AutoDisposeFutureProviderRef<
    Either<AppError, Map<RouteStop, List<StopArrival>>>> {
  /// The parameter `marker` of this provider.
  StopMarker get marker;
}

class _StopArrivalsByMarkerProviderElement
    extends AutoDisposeFutureProviderElement<
        Either<AppError, Map<RouteStop, List<StopArrival>>>>
    with StopArrivalsByMarkerRef {
  _StopArrivalsByMarkerProviderElement(super.provider);

  @override
  StopMarker get marker => (origin as StopArrivalsByMarkerProvider).marker;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
