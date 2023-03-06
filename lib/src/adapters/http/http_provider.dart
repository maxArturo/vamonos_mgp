import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/adapters/cache/cache_provider.dart';
import 'package:vamonos_mgp/src/adapters/http/config.dart' as config;

import 'http.dart';

part 'http_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) => Dio();

@riverpod
Map<String, String> defaultHeaders(DefaultHeadersRef ref) =>
    config.defaultHeaders;

@riverpod
HttpAdapter httpAdapter(HttpAdapterRef ref) => HttpAdapter(
    ref.watch(dioProvider),
    ref.watch(requestCacheInterceptorProvider),
    ref.watch(responseCacheInterceptorProvider),
    ref.watch(defaultHeadersProvider));

@riverpod
RequestCacheInterceptor requestCacheInterceptor(
        RequestCacheInterceptorRef ref) =>
    RequestCacheInterceptor(ref.watch(cacheAdapterProvider));

@riverpod
ResponseCacheInterceptor responseCacheInterceptor(
        ResponseCacheInterceptorRef ref) =>
    ResponseCacheInterceptor(ref.watch(cacheAdapterProvider));
