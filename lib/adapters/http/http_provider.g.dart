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

String _$dioHash() => r'c62213bddb9aac89c0a19fe034ef243e2a285ba8';

/// See also [dio].
final dioProvider = AutoDisposeProvider<Dio>(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
);
typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$httpAdapterHash() => r'51656d77e206ff017e06704af9f4d6bd76119470';

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
