import 'package:dio/dio.dart';
import 'package:poc_ws_app/src/config/api_config.dart';
import 'package:poc_ws_app/src/config/http_client.dart';
import 'package:poc_ws_app/src/modules/auth/models/login_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/user_model.dart';
import 'package:poc_ws_app/src/modules/auth/view-models/login_view_model.dart';

class LoginService {
  HttpClient httpClient;

  LoginService() {
    this.httpClient = new HttpClient();
  }

  Future<UserModel> login(LoginViewModel model) async {
    Response response;
    var data = LoginRequestModel(email: model.email, password: model.password);
    response =
        await httpClient.postHttp('$BASE_API_URL/login', data: data.toJson());

    return UserModel.fromJson(response.data);
  }
}
