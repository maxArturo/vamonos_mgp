import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vamonos_mgp/util/errors.dart';

typedef HttpAdapterResponse<T> = Future<Either<HttpError, T>>;

String? cacheDisabled = dotenv.env['CACHE_DISABLED'];

class HttpAdapter {
  static HttpAdapter? _instance;
  final _dio = Dio();
  bool _initialized = false;
  late CacheOptions _cacheOptions;

  factory HttpAdapter() => _instance ??= HttpAdapter._internal();

  HttpAdapter._internal() {
    _instance = this;
  }

  _initialize() async {
    if (cacheDisabled != null) {
      final store = await (getApplicationDocumentsDirectory()
          .then((dir) => HiveCacheStore(dir.path)));
      _cacheOptions = CacheOptions(
        // A default store is required for interceptor.
        // store: HiveCacheStore((getApplicationDocumentsDirectory()).path),
        store: store,

        // All subsequent fields are optional.
        policy: CachePolicy.request,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(seconds: 3600),
        // Default. Key builder to retrieve requests.
        keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        // Default. Allows to cache POST requests.
        // Overriding [keyBuilder] is strongly recommended when [true].
        allowPostMethod: false,
      );
      _dio.interceptors.add(DioCacheInterceptor(options: _cacheOptions));
    }

    _dio.interceptors.addAll([
      RetryInterceptor(
        dio: _dio,
        logPrint: print, // specify log function (optional)
        retries: 3, // retry count (optional)
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),
      PrettyDioLogger(),
    ]);
    _dio.interceptors.removeImplyContentTypeInterceptor();
  }

  get initialized => _initialized;

  _ensureInitialized() async {
    if (!initialized) {
      await _initialize();
      _initialized = true;
    }
  }

  final defaultHeaders = {
    'User-Agent': 'com.vamonos-mgp.app',
    "Accept-Encoding": "gzip, deflate",
    "Accept-Language": "en-US,en;q=0.5",
  };

  HttpAdapterResponse<dynamic> post(
      {required String url,
      required String body,
      Map<String, dynamic>? extraHeaders,
      Duration? maxDuration}) async {
    await _ensureInitialized();

    final Response<dynamic> response = await _dio.post(url,
        data: body,
        options: _mergeDioAndCacheOptions(
            dioOptions: Options(
              headers: {
                'User-Agent': 'com.vamonos-mgp.app',
                "Accept-Encoding": "gzip, deflate",
                "Content-Type": Headers.formUrlEncodedContentType,
                ...extraHeaders ?? {},
              },
            ),
            cacheOptions: maxDuration != null
                ? _cacheOptions.copyWith(maxStale: Nullable(maxDuration))
                : null));

    if (response.statusCode != 200) {
      return Left(HttpError());
    }
    return Right(response.data);
  }

  /// A utility method used to merge together [Options]
  /// and [CacheOptions].
  ///
  /// Returns an [Options] object with [CacheOptions] stored
  /// in the [options.extra] key.
  Options? _mergeDioAndCacheOptions({
    Options? dioOptions,
    CacheOptions? cacheOptions,
  }) {
    if (dioOptions == null && cacheOptions == null) {
      return null;
    } else if (dioOptions == null && cacheOptions != null) {
      return cacheOptions.toOptions();
    } else if (dioOptions != null && cacheOptions == null) {
      return dioOptions;
    }

    final cacheOptionsMap = cacheOptions!.toExtra();
    final options = dioOptions!.copyWith(
      extra: <String, dynamic>{
        ...dioOptions.extra!,
        ..._cacheOptions.toExtra(),
        ...cacheOptionsMap
      },
    );
    return options;
  }
}
