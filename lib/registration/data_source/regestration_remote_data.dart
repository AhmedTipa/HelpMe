import 'package:dio/dio.dart';

Dio? dio;

void registrationInitDio() {
  dio = Dio(
    BaseOptions(
      baseUrl: 'https://important-gilet-toad.cyclic.app',
      receiveDataWhenStatusError: true,
      headers: <String, String>{'Content-Type': 'application/json'},
    ),
  );
}

Future<Response<dynamic>> postData({
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
      headers: <String,dynamic>{
        'authentication': token,
      },
    ),
  );
}

Future<Response<dynamic>> signup({
  required String url,
  Map<String, dynamic>? data,

}) async => dio!.post(
    url,
    data: data,
  );
