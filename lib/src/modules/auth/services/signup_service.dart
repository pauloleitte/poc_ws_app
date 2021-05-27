import 'package:dio/dio.dart';
import 'package:poc_ws_app/src/config/api_config.dart';
import 'package:poc_ws_app/src/config/http_client.dart';
import 'package:poc_ws_app/src/modules/auth/models/signup_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/view-models/signup_view_model.dart';

class SignupService {
  HttpClient httpClient;

  SignupService() {
    this.httpClient = new HttpClient();
  }

  Future<bool> signup(SignupViewModel model) async {
    var data = SignupRequestModel(
        email: model.email, name: model.name, password: model.password);
    Response response;
    print(data.toJson());
    response =
        await httpClient.postHttp('$BASE_API_URL/signup', data: data.toJson());
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
