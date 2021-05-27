import 'package:poc_ws_app/src/modules/auth/models/user_model.dart';
import 'package:poc_ws_app/src/modules/auth/services/login_service.dart';
import 'package:poc_ws_app/src/modules/auth/view-models/login_view_model.dart';

class LoginController {
  LoginService service;

  LoginController() {
    this.service = new LoginService();
  }
  Future<UserModel> login(LoginViewModel model) async {
    model.busy = true;
    var user = await service.login(model);
    model.busy = false;
    return user;
  }
}
