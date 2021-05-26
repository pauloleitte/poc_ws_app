import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/modules/auth/widgets/body_forgot_password.dart';
import 'package:poc_ws_app/src/utils/app_routes.dart';
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
          actions: [
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.popAndPushNamed(context, AppRoutes.AUTH_HOME);
                })
          ],
        ),
        body: BodyForgotPassword());
  }
}
