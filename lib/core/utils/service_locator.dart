import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:my_clean_architecture/core/network/dio_service.dart';
import 'package:my_clean_architecture/core/network/interceptors/api_interceptor.dart';
import 'package:my_clean_architecture/core/network/network_client.dart';
import 'package:my_clean_architecture/core/utils/key_value_storage_base.dart';
import 'package:my_clean_architecture/core/utils/key_value_storage_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<void> setupKeyValueStorageService() async {
  await KeyValueStorageBase.init();

  GetIt.I.registerSingleton<KeyValueStorageService>(KeyValueStorageService());
}

void setupApiService() {
  final cacheOptions = CacheOptions(
    store: MemCacheStore(
      maxEntrySize: 1024 * 1024 * 20, // 20MB
      maxSize: (1024 * 1024 * 21) * 5,
    ), 
    policy: CachePolicy.noCache, // Bcz we force cache on-demand in repositories
    maxStale: const Duration(days: 30), // No of days cache is valid
    keyBuilder: (options) => options.path,
  );
  final dioService = DioService(
    dioClient: Dio(),
    interceptors: [
      ApiInterceptor(),
      ChuckerDioInterceptor(),
      DioCacheInterceptor(options: cacheOptions),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        enabled: kDebugMode,
      ),
    ],
  );

  GetIt.I.registerSingleton<NetworkClient>(NetworkClient(dioService));
}
