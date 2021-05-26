import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/modules/auth/widgets/body_reset_password.dart';
import 'package:poc_ws_app/src/utils/app_routes.dart';
import 'package:poc_ws_app/src/utils/constants.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({Key key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
        body: SingleChildScrollView(child: BodyResetPassword()));
  }
}
