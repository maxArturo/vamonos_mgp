import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/adapters/cache/cache_provider.dart';

import 'http.dart';

part 'http_provider.g.dart';

@riverpod
Dio dio(DioRef ref) => Dio();

@riverpod
HttpAdapter httpAdapter(HttpAdapterRef ref) => HttpAdapter(
    ref.watch(dioProvider),
    ref.watch(requestCacheInterceptorProvider),
    ref.watch(responseCacheInterceptorProvider));

@riverpod
RequestCacheInterceptor requestCacheInterceptor(
        RequestCacheInterceptorRef ref) =>
    RequestCacheInterceptor(ref.watch(cacheAdapterProvider));

@riverpod
ResponseCacheInterceptor responseCacheInterceptor(
        ResponseCacheInterceptorRef ref) =>
    ResponseCacheInterceptor(ref.watch(cacheAdapterProvider));
