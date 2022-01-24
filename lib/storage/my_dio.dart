import 'package:dio/dio.dart';

class MyDio {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        // baseUrl: 'https://student.valuxapps.com/api/',
        // baseUrl: 'https://192.168.45.61:8000/api/',
        baseUrl: 'https://reqres.in/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token ?? '',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    // Map<String, dynamic> ?query,
    // String ? token,
  }) async {
    dio.options.headers = {
      'accept': 'Application/json',
    };
    return dio.post(
      url,
      // queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token ?? '',
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
