import 'package:dio/dio.dart';
import 'package:poc_ws_app/src/config/api_config.dart';
import 'package:poc_ws_app/src/config/http_client.dart';
import 'package:poc_ws_app/src/modules/auth/models/forgot_password_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/view-models/forgot_password_view_model.dart';

class ForgotPasswordService {
  HttpClient httpClient;

  ForgotPasswordService() {
    this.httpClient = new HttpClient();
  }
  Future<bool> forgotPassword(ForgotPasswordViewModel model) async {
    Response response;
    var data = ForgotPasswordRequestModel(email: model.email);
    response = await httpClient.postHttp('$BASE_API_URL/forgot-password',
        data: data.toJson());
    if (response.statusCode == 204) {
      return true;
    }
    return false;
  }
}
