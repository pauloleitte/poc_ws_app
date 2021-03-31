import 'package:flutter/widgets.dart';
import 'package:poc_ws_app/modules/home/pages/home-page.dart';
import 'package:poc_ws_app/modules/patient/pages/patient-form-page.dart';
import 'package:poc_ws_app/modules/patient/pages/patient-page.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  PatientPage.routeName: (context) => PatientPage(),
  PatientFormPage.routeName: (context) => PatientFormPage(),
};
