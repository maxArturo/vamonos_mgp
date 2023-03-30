// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persisted_state_provider.dart';

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

String _$PersistedStateHash() => r'201c4bd11d6b7930b19bf4c7bc517f96985d9f73';

/// See also [PersistedState].
final persistedStateProvider = AutoDisposeAsyncNotifierProvider<PersistedState,
    Either<AppError, AppPersistedState>>(
  PersistedState.new,
  name: r'persistedStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$PersistedStateHash,
);
typedef PersistedStateRef
    = AutoDisposeAsyncNotifierProviderRef<Either<AppError, AppPersistedState>>;

abstract class _$PersistedState
    extends AutoDisposeAsyncNotifier<Either<AppError, AppPersistedState>> {
  @override
  FutureOr<Either<AppError, AppPersistedState>> build();
}

String _$pathHash() => r'cb461a746817a794ca1e7690f39ba23506de25a1';

/// See also [path].
final pathProvider = Provider<Future<Directory> Function()>(
  path,
  name: r'pathProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pathHash,
);
typedef PathRef = ProviderRef<Future<Directory> Function()>;
