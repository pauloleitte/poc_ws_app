import 'package:dio/dio.dart';

class AppHttpClient {
  final dio = Dio();

  Future<Response<dynamic>> getHttp(String url) async {
    try {
      var response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response<dynamic>> postHttp(String url, {Map data}) async {
    try {
      var response = await dio.post(url, data: data);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response<dynamic>> deleteHttp(String url) async {
    try {
      var response = await dio.delete(url);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response<dynamic>> putHttp(String url, {Map data}) async {
    try {
      var response = await dio.put(url, data: data);
      return response;
    } on DioError catch (e) {
      return e.response;
      
    }
  }
}
