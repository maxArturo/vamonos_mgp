// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persisted_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pathHash() => r'cb461a746817a794ca1e7690f39ba23506de25a1';

/// See also [path].
@ProviderFor(path)
final pathProvider = Provider<Future<Directory> Function()>.internal(
  path,
  name: r'pathProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PathRef = ProviderRef<Future<Directory> Function()>;
String _$persistedStateHash() => r'9527f474fda8aab7f5f727555d25317f41bbca09';

/// See also [PersistedState].
@ProviderFor(PersistedState)
final persistedStateProvider = AutoDisposeAsyncNotifierProvider<PersistedState,
    Either<AppError, AppPersistedState>>.internal(
  PersistedState.new,
  name: r'persistedStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$persistedStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PersistedState
    = AutoDisposeAsyncNotifier<Either<AppError, AppPersistedState>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
