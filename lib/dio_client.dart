import 'package:dio/dio.dart';

Dio buildDioClient() {
  Dio dio =
      Dio()
        ..options = BaseOptions(
          baseUrl: 'https://dev-api.getsolo.io/',
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 3),
          sendTimeout: Duration(seconds: 3),
        );
  dio.interceptors.addAll([
    LogInterceptor(
      request: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true,
    ),
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add any custom logic before the request is sent
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Add any custom logic after the response is received
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        // Handle errors
        return handler.next(e);
      },
    ),
  ]);
  dio.options.headers['Solo-App'] = 'UKFQD1wwUBev4PRP';
  dio.options.headers['User-Agent'] =
      '{"Device":"Phone Brand: google, Model (and Product): sdk_gphone64_arm64 (sdk_gphone64_arm64), OS Version: 6.1.23-android14-4-00257-g7e35917775b8-ab9964412 (12096271)","OS":"34","App-version":"4.1.3"}';
  dio.options.headers['Accept-Language'] = 'en-us';
  return dio;
}
