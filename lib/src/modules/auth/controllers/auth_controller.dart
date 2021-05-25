import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/modules/auth/models/forgot_password_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/login_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/reset_password_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/signup_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/models/user_model.dart';
import 'package:poc_ws_app/src/modules/auth/services/auth_service.dart';

enum AuthState { idle, success, error, loading }

class AuthController extends ChangeNotifier {
  final AuthService authService;
  var userModel = UserModel();
  var stateSignup = AuthState.idle;
  var stateLogin = AuthState.idle;
  var stateForgotPassword = AuthState.idle;

  AuthController(this.authService);

  Future<void> login(LoginRequestModel model) async {
    stateLogin = AuthState.loading;
    notifyListeners();
    try {
      userModel = await authService.login(model);
      stateLogin = AuthState.success;
      notifyListeners();
    } catch (e) {
      stateLogin = AuthState.error;
      notifyListeners();
    }
  }

  Future<void> signup(SignupRequestModel model) async {
    stateSignup = AuthState.loading;
    notifyListeners();
    try {
      await authService.signup(model);
      stateSignup = AuthState.success;
      notifyListeners();
    } catch (e) {
      stateSignup = AuthState.error;
      notifyListeners();
    }
  }

  Future<void> forgotPassword(ForgotPasswordRequestModel model) async {
    stateForgotPassword = AuthState.loading;
    notifyListeners();
    try {
      await authService.forgotPassword(model);
      stateForgotPassword = AuthState.success;
      notifyListeners();
    } catch (e) {
      stateForgotPassword = AuthState.error;
      notifyListeners();
    }
  }

  Future<void> resetPassword(ResetPasswordRequestModel model) async {
    stateForgotPassword = AuthState.loading;
    notifyListeners();
    try {
      await authService.resetPassword(model);
      stateForgotPassword = AuthState.success;
      notifyListeners();
    } catch (e) {
      stateForgotPassword = AuthState.error;
      notifyListeners();
    }
  }
}
