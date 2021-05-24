import 'package:flutter/cupertino.dart';
import 'package:poc_ws_app/src/config/api_config.dart';
import 'package:poc_ws_app/src/config/app_http_client.dart';
import 'package:poc_ws_app/src/modules/auth/models/login_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/signup_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/user_model.dart';

class AuthService {
  final AppHttpClient appHttpClient;

  AuthService(this.appHttpClient);

  Future<UserModel> login(LoginRequestModel model) async {
    try {
      var userModel = UserModel.fromJson(await appHttpClient
          .postHttp('$BASE_API_URL/login', data: model.toJson()));

      return userModel;
    } catch (e) {
      print(e);
    }
  }

  Future<void> signup(SignupRequestModel model) async {
    Map<String, dynamic> response = await appHttpClient
        .postHttp('$BASE_API_URL/login', data: model.toJson());
    print(response);
    return Future.value();
  }
}
