import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/modules/auth/widgets/body_signup.dart';
import 'package:poc_ws_app/src/utils/constants.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
        ),
        body: BodySignup());
  }
}
