import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/modules/auth/widgets/body_forgot_password.dart';
import 'package:poc_ws_app/src/utils/app-routes.dart';
import 'package:poc_ws_app/src/utils/constants.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text("Recuperação de senha"),
            centerTitle: true,
            leading: IconButton(
              alignment: Alignment.centerLeft,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.AUTH_HOME);
              },
            )),
        body: SingleChildScrollView(child: BodyForgotPassword()));
  }
}
