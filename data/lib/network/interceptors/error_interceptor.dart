import 'dart:io';

import 'package:core/utils/string_extension.dart';
import 'package:data/errors/exceptions.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final response = err.response;
    final statusCode = response?.statusCode;

    /// Response info, it may be `null` if the request can't reach to
    /// the http server, for example, occurring a dns error, network is not
    /// available.

    if (response == null || err is SocketException) {
      handler.reject(NoInternetException(err.requestOptions));
    } else if (statusCode != null && statusCode >= 300) {
      handler.reject(
        ServerException(
          response.statusCode,
          response.statusMessage.orEmpty,
          err.requestOptions,
        ),
      );
    } else {
      handler.next(err);
    }
  }
}
