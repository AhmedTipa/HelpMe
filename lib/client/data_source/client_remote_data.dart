import 'package:dio/dio.dart';

late Dio? dio;

void clientInitDio() {
  dio = Dio(
    BaseOptions(
      baseUrl: 'https://important-gilet-toad.cyclic.app',
      receiveDataWhenStatusError: true,

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
  dio!.options.headers = <String, dynamic>{
    'authentication': token,
    'Content-Type': 'application/json'
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

Future<Response<dynamic>> clientGetData({
  required String url,
  Map<String, dynamic>? data,
  String? token,
}) async {
  return dio!.get(
    url,
    options: Options(
      headers: <String, dynamic>{
        'authentication': token,
      },
    ),
  );
}
