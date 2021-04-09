import 'package:flutter/material.dart';
import 'package:poc_ws_app/modules/login/widgets/body-login.dart';
import 'package:poc_ws_app/utils/size-config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: BodyLogin());
  }
}
