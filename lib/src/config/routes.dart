import 'package:flutter/widgets.dart';
import 'package:poc_ws_app/src/modules/auth/models/reset_password_request_model.dart';
import 'package:poc_ws_app/src/modules/auth/pages/forgot_password_page.dart';
import 'package:poc_ws_app/src/modules/auth/pages/login_page.dart';
import 'package:poc_ws_app/src/modules/auth/pages/reset_password_page.dart';
import 'package:poc_ws_app/src/modules/auth/pages/signup_page.dart';
import 'package:poc_ws_app/src/modules/home/pages/home-page.dart';
import 'package:poc_ws_app/src/modules/patient/pages/patient-form-page.dart';
import 'package:poc_ws_app/src/modules/patient/pages/patient-page.dart';
import 'package:poc_ws_app/src/modules/splash/pages/splash_page.dart';
import 'package:poc_ws_app/src/utils/app-routes.dart';

final Map<String, WidgetBuilder> routes = {
  AppRoutes.SPLASH: (context) => SplashPage(),
  AppRoutes.AUTH_SIGNUP: (context) => SignupPage(),
  AppRoutes.AUTH_HOME: (context) => LoginPage(),
  AppRoutes.AUTH_FORGOT_PASSWORD: (context) => ForgotPasswordPage(),
  AppRoutes.AUTH_RESET_PASSWORD: (context) => ResetPasswordPage(),
  AppRoutes.HOME: (context) => HomePage(),
  AppRoutes.PATIENTS: (context) => PatientPage(),
  AppRoutes.PATIENT_FORM: (context) => PatientFormPage()
};
