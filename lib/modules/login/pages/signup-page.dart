import 'package:flutter/material.dart';
import 'package:poc_ws_app/modules/login/widgets/body-signup.dart';
import 'package:poc_ws_app/utils/constants.dart';

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
          title: Text("Registrar"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(child: BodySignup()));
  }
}
