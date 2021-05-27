import 'package:dio/dio.dart';

class HttpClient {
  final dio = Dio();

  Future<void> getHttp(String url) async {
    try {
      var response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response> postHttp(String url, {Map data}) async {
    try {
      var response = await dio.post(url, data: data);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<void> deleteHttp(String url) async {
    try {
      var response = await dio.delete(url);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<void> putHttp(String url, {Map data}) async {
    try {
      var response = await dio.put(url, data: data);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
