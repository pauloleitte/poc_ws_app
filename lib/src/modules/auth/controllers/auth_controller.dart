import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/modules/auth/models/login_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/signup_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/user_model.dart';
import 'package:poc_ws_app/src/modules/auth/services/auth_service.dart';

enum AuthState { idle, success, error, loading }

class AuthController extends ChangeNotifier {


  final AuthService authService;
  var userModel = UserModel();
  var state = AuthState.idle;

  AuthController(this.authService);

  Future<void> login(LoginRequestModel model) async {
    userModel = await authService.login(model);
    notifyListeners();
  }

  Future<void> signup(SignupRequestModel model) async {
    return authService.signup(model);
    notifyListeners();
  }
}
