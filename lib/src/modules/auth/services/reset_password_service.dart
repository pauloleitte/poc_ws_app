import 'package:poc_ws_app/src/config/http_client.dart';
import 'package:poc_ws_app/src/modules/auth/models/reset_password_request_model.dart';

class ResetPasswordService {
  HttpClient httpClient;
  ResetPasswordService() {
    this.httpClient = new HttpClient();
  }
  Future<void> resetPassword(ResetPasswordRequestModel model) async {
    var response = await httpClient.postHttp('reset-password');
    print(response);
  }
}
