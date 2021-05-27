import 'package:poc_ws_app/src/modules/auth/services/signup_service.dart';
import 'package:poc_ws_app/src/modules/auth/view-models/signup_view_model.dart';

class SignupController {
  SignupService service;

  SignupController() {
    this.service = new SignupService();
  }

  Future<bool> signup(SignupViewModel model) async {
    model.busy = true;
    bool result = await service.signup(model);
    model.busy = false;
    return result;
  }
}
