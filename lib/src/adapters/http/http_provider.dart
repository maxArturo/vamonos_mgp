import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/cache/cache_provider.dart';
import 'package:vamonos_mgp/src/adapters/http/config.dart' as config;
import 'package:vamonos_mgp/src/util/config_provider.dart';

import 'http.dart';

part 'http_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) => Dio();

@Riverpod(keepAlive: true)
Map<String, String> defaultHeaders(DefaultHeadersRef ref) {
  final apiUser = ref.watch(configProvider).apiUser;
  final apiPw = ref.watch(configProvider).apiPw;

  return {
    ...config.defaultHeaders,
    if (apiUser != null && apiPw != null)
      HttpHeaders.authorizationHeader:
          "Basic ${base64Encode(utf8.encode('$apiUser:$apiPw'))}"
  };
}

@Riverpod(keepAlive: true)
HttpAdapter httpAdapter(HttpAdapterRef ref) {
  final config = ref.watch(configProvider);
  return HttpAdapter(
    dio: ref.watch(dioProvider),
    requestCacheInterceptor: ref.watch(requestCacheInterceptorProvider),
    responseCacheInterceptor: ref.watch(responseCacheInterceptorProvider),
    defaultHeaders: ref.watch(defaultHeadersProvider),
    cacheDisabled: config.cacheDisabled,
  );
}

@Riverpod(keepAlive: true)
RequestCacheInterceptor requestCacheInterceptor(
    RequestCacheInterceptorRef ref) {
  final config = ref.watch(configProvider);
  return RequestCacheInterceptor(
    cacheAdapter: ref.watch(cacheAdapterProvider),
    failureEnabled: config.httpAddNetworkFailure,
    delayMs: config.httpCacheAddDelayMs,
  );
}

// failureEnabled: config.httpAddNetworkFailure,
@Riverpod(keepAlive: true)
ResponseCacheInterceptor responseCacheInterceptor(
        ResponseCacheInterceptorRef ref) =>
    ResponseCacheInterceptor(ref.watch(cacheAdapterProvider));
