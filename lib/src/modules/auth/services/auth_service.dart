import 'package:poc_ws_app/src/config/api_config.dart';
import 'package:poc_ws_app/src/config/app_http_client.dart';
import 'package:poc_ws_app/src/ex/auth_exception.dart';
import 'package:poc_ws_app/src/modules/auth/models/forgot_password_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/login_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/reset_password_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/signup_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/user_model.dart';

class AuthService {
  final AppHttpClient appHttpClient;

  AuthService(this.appHttpClient);

  Future<UserModel> login(LoginRequestModel model) async {
    var response = await appHttpClient.postHttp('$BASE_API_URL/login',
        data: model.toJson());
    if (response.statusCode == 200) {
      var userModel = UserModel.fromJson(response.data);
      return userModel;
    } else {
      if (response.statusCode == 400) {
        throw AuthException(response.data.message);
      }
    }
  }

  Future<bool> signup(SignupRequestModel model) async {
    var response = await appHttpClient.postHttp('$BASE_API_URL/signup',
        data: model.toJson());
    if (response.statusCode == 201) {
      return Future.value();
    } else {
      if (response.statusCode == 400) {
        throw AuthException(response.data.message);
      }
    }
  }

  Future<void> forgotPassword(ForgotPasswordRequestModel model) async {
    var response = await appHttpClient.postHttp('$BASE_API_URL/forgot-password',
        data: model.toJson());
    if (response.statusCode == 204) {
      return Future.value();
    } else {
      if (response.statusCode == 400) {
        throw AuthException(response.data.message);
      }
    }
  }

  
  Future<void> resetPassword(ResetPasswordRequestModel model) async {
    var response = await appHttpClient.postHttp('$BASE_API_URL/forgot-password',
        data: model.toJson());
    if (response.statusCode == 204) {
      return Future.value();
    } else {
      if (response.statusCode == 400) {
        throw AuthException(response.data.message);
      }
    }
  }
}
