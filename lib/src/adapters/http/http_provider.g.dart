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
String _$defaultHeadersHash() => r'0af5ce3385a10c7171f839905851735855ce98fe';

/// See also [defaultHeaders].
final defaultHeadersProvider = Provider<Map<String, String>>(
  defaultHeaders,
  name: r'defaultHeadersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultHeadersHash,
);
typedef DefaultHeadersRef = ProviderRef<Map<String, String>>;
String _$httpAdapterHash() => r'5106f01064e9bc4f3456ea7ab8b2bdee43525578';

/// See also [httpAdapter].
final httpAdapterProvider = Provider<HttpAdapter>(
  httpAdapter,
  name: r'httpAdapterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$httpAdapterHash,
);
typedef HttpAdapterRef = ProviderRef<HttpAdapter>;
String _$requestCacheInterceptorHash() =>
    r'cfb66a875d9b35c164637071ed7b1e2ba80a6b71';

/// See also [requestCacheInterceptor].
final requestCacheInterceptorProvider = Provider<RequestCacheInterceptor>(
  requestCacheInterceptor,
  name: r'requestCacheInterceptorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$requestCacheInterceptorHash,
);
typedef RequestCacheInterceptorRef = ProviderRef<RequestCacheInterceptor>;
String _$responseCacheInterceptorHash() =>
    r'f2d1d2365370d44f175689fd3657f8d05f8bd04f';

/// See also [responseCacheInterceptor].
final responseCacheInterceptorProvider = Provider<ResponseCacheInterceptor>(
  responseCacheInterceptor,
  name: r'responseCacheInterceptorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$responseCacheInterceptorHash,
);
typedef ResponseCacheInterceptorRef = ProviderRef<ResponseCacheInterceptor>;
