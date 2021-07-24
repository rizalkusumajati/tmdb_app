
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

Dio addInterceptors(Dio dio) {

  return dio..interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler requestInterceptorHandler) => {
        requestInterceptor(options),
        requestInterceptorHandler.next(options)
      },
      onResponse: (Response response, ResponseInterceptorHandler responseInterceptorHandler) => {
        responseInterceptor(response),
        responseInterceptorHandler.next(response)
      },
      onError: (DioError error, ErrorInterceptorHandler errorInterceptorHandler) => {
        errorInterceptor(error),
        errorInterceptorHandler.next(error)
      }
  ));
}


dynamic errorInterceptor(DioError err) async {
  debugPrint('*** Api Error - Start ***:');

  debugPrint('URI: ${err.requestOptions.uri}');
  if (err.response != null) {
    debugPrint('STATUS CODE: ${err.response?.statusCode ?? 0}');
  }
  debugPrint('$err');
  if (err.response != null) {
    debugPrint('REDIRECT'+ (err.response?.realUri?.toString() ?? ""));
    debugPrint('BODY:');
    debugPrint(err.response?.toString());
  }

  debugPrint('*** Api Error - End ***:');
}

/**
 * Log the request on console
 */
dynamic responseInterceptor(Response response) async {
  debugPrint('*** Api Response - Start ***:');
  debugPrint(response.statusCode.toString() +
      "--> ${response.requestOptions.method != null ? response.requestOptions.method.toUpperCase() : 'METHOD'} ${"" + (response.requestOptions.baseUrl) + (response.requestOptions.path)}");

  if (response.data != null) {
    Logger().i("response: ->${response.data.toString()}");
  }
  debugPrint('*** Api Response - End ***:');
}

/**
 * Log the request on console
 */
requestInterceptor(RequestOptions options) {
  debugPrint(
      "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl) + (options.path )}");
  print("Headers:");
  options.headers.forEach((k, v) => print('$k: $v'));
  if (options.queryParameters != null) {
    print("queryParameters:");
    options.queryParameters.forEach((k, v) => print('$k: $v'));
  }
  if (options.data != null) {
    print("Body: ${options.data}");
  }
  print(
      "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");


}


Dio setupDio(){
  Dio valDio = Dio(BaseOptions(contentType: "application/json"));
  valDio = addInterceptors(valDio);
  return valDio;
}
