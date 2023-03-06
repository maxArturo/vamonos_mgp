// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_provider.dart';

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

String _$dioHash() => r'41b696b35e5b56ccb124ee5abab8b893747d2153';

/// See also [dio].
final dioProvider = Provider<Dio>(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
);
typedef DioRef = ProviderRef<Dio>;
String _$defaultHeadersHash() => r'8a69837ca3192ac6b2d6ae37b1a8da9b27d10108';

/// See also [defaultHeaders].
final defaultHeadersProvider = AutoDisposeProvider<Map<String, String>>(
  defaultHeaders,
  name: r'defaultHeadersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultHeadersHash,
);
typedef DefaultHeadersRef = AutoDisposeProviderRef<Map<String, String>>;
String _$httpAdapterHash() => r'50cf087750e0663b6bc190fac0663939b2d336bf';

/// See also [httpAdapter].
final httpAdapterProvider = AutoDisposeProvider<HttpAdapter>(
  httpAdapter,
  name: r'httpAdapterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$httpAdapterHash,
);
typedef HttpAdapterRef = AutoDisposeProviderRef<HttpAdapter>;
String _$requestCacheInterceptorHash() =>
    r'2cd7e3095b5b5b7774086426ee603f5a6ab206e6';

/// See also [requestCacheInterceptor].
final requestCacheInterceptorProvider =
    AutoDisposeProvider<RequestCacheInterceptor>(
  requestCacheInterceptor,
  name: r'requestCacheInterceptorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$requestCacheInterceptorHash,
);
typedef RequestCacheInterceptorRef
    = AutoDisposeProviderRef<RequestCacheInterceptor>;
String _$responseCacheInterceptorHash() =>
    r'9844437c86934f2fc905581296dff17a56c53a3b';

/// See also [responseCacheInterceptor].
final responseCacheInterceptorProvider =
    AutoDisposeProvider<ResponseCacheInterceptor>(
  responseCacheInterceptor,
  name: r'responseCacheInterceptorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$responseCacheInterceptorHash,
);
typedef ResponseCacheInterceptorRef
    = AutoDisposeProviderRef<ResponseCacheInterceptor>;
