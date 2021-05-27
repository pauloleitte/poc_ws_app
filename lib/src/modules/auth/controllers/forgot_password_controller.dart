import 'package:poc_ws_app/src/modules/auth/services/forgot_password_service.dart';
import 'package:poc_ws_app/src/modules/auth/view-models/forgot_password_view_model.dart';

class ForgotPasswordController {
  ForgotPasswordService service;

  ForgotPasswordController() {
    this.service = new ForgotPasswordService();
  }

  Future<bool> forgotPassword(ForgotPasswordViewModel model) async {
    model.busy = true;
    bool result = await service.forgotPassword(model);
    model.busy = false;
    return result;
  }
}
