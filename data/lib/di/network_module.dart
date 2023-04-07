import 'package:core/configuration/configuration.dart' as config;
import 'package:data/network/interceptors/error_interceptor.dart';
import 'package:data/network/interceptors/header_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void init(GetIt locator) {
  locator.registerLazySingleton<Dio>(() {
    final baseOptions = BaseOptions(
      baseUrl: config.baseUrl,
    );

    final dio = Dio(baseOptions);
    dio.interceptors.addAll([
      HeaderInterceptor(),
      LogInterceptor(
        request: false,
        responseHeader: false,
        responseBody: true,
      ),
      ErrorInterceptor(),
    ]);
    return dio;
  });
}
