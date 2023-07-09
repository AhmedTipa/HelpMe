import 'package:dio/dio.dart';

Dio? dio;

void technicalInitDio() {
  dio = Dio(
    BaseOptions(
      baseUrl: 'https://important-gilet-toad.cyclic.app',
      receiveDataWhenStatusError: true,
      headers: <String, String>{'Content-Type': 'application/json'},
    ),
  );
}

Future<Response<dynamic>> technicalPostData({
  required String url,
  Map<String, dynamic>? data,
  String? token,
}) async {
  dio!.options.headers = <String, dynamic>{
    'authentication': token,
  };
  return dio!.post(
    url,
    data: data,
    options: Options(
      headers: <String, dynamic>{
        'authentication': token,
      },
    ),
  );
}

Future<Response<dynamic>> technicalGetData({
  required String url,
  Map<String, dynamic>? data,
  String? token,
}) async {
  dio!.options.headers = <String, dynamic>{
    'authentication': token,
    'Content-Type': 'application/json'
  };
  return dio!.get(
    url,
    options: Options(
      headers: <String, dynamic>{
        'authentication': token,
      },
    ),
  );
}
