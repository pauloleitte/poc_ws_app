import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/modules/auth/widgets/body_reset_password.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({Key key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: BodyResetPassword()));
  }
}
