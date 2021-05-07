import 'package:flutter/widgets.dart';
import 'package:poc_ws_app/modules/home/pages/home-page.dart';
import 'package:poc_ws_app/modules/login/pages/login-page.dart';
import 'package:poc_ws_app/modules/login/pages/signup-page.dart';
import 'package:poc_ws_app/modules/patient/pages/patient-form-page.dart';
import 'package:poc_ws_app/modules/patient/pages/patient-page.dart';
import 'package:poc_ws_app/modules/splash/pages/splash_page.dart';
import 'package:poc_ws_app/utils/app-routes.dart';

final Map<String, WidgetBuilder> routes = {
  AppRoutes.SPLASH: (context) => SplashPage(),
  AppRoutes.AUTH_SIGNUP: (context) => SignupPage(),
  AppRoutes.AUTH_HOME: (context) => LoginPage(),
  AppRoutes.HOME: (context) => HomePage(),
  AppRoutes.PATIENTS: (context) => PatientPage(),
  AppRoutes.PATIENT_FORM: (context) => PatientFormPage()
};
