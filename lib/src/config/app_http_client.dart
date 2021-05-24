import 'package:dio/dio.dart';

class AppHttpClient {
  final dio = Dio();
  Future<Map<String, dynamic>> getHttp(String url) async {
    try {
      var response = await dio.get(url);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> postHttp(String url, {Map data}) async {
    try {
      var response = await dio.post(url, data: data);
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>> deleteHttp(String url) async {
    try {
      var response = await dio.delete(url);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> putHttp(String url, {Map data}) async {
    try {
      var response = await dio.put(url, data: data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
