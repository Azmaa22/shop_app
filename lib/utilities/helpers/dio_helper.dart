import 'package:dio/dio.dart';
import 'package:shop_app/services/apis/base_url.dart';

class DioHelper {
  static late Dio dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    Map<String, dynamic>? headers,
  }) async {
    dio.options.headers = headers; //?? dio.options.headers;
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    dio.options.headers = headers; //?? dio.options.headers;
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
