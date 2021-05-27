import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/modules/auth/controllers/forgot_password_controller.dart';
import 'package:poc_ws_app/src/modules/auth/view-models/forgot_password_view_model.dart';
import 'package:poc_ws_app/src/utils/constants.dart';
import 'package:poc_ws_app/src/utils/size_config.dart';

class BodyForgotPassword extends StatefulWidget {
  BodyForgotPassword({Key key}) : super(key: key);

  @override
  _BodyForgotPasswordState createState() => _BodyForgotPasswordState();
}

class _BodyForgotPasswordState extends State<BodyForgotPassword> {
  final _form = GlobalKey<FormState>();

  final _emailFocusNode = FocusNode();

  final _controller = ForgotPasswordController();

  var model = ForgotPasswordViewModel();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> forgotPassword() async {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      setState(() {});
      var result = await _controller.forgotPassword(model);
      debugPrint(result.toString());
      setState(() {});
    }
  }

  Widget buildEmail() {
    return TextFormField(
        focusNode: _emailFocusNode,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: 'e-mail',
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
                color: kSecondaryColor,
                fontWeight: _emailFocusNode.hasFocus
                    ? FontWeight.bold
                    : FontWeight.normal)),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            return 'campo obrigatório';
          }
          return null;
        },
        onSaved: (value) {
          model.email = value;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: kPrimaryColor,
      child: model.busy
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                    ),
                    Text('Carregando')
                  ]),
            )
          : Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Form(
                  key: _form,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Esqueci minha senha',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text('Insira o e-mail associado à sua conta.'),
                        SizedBox(
                          height: 100,
                        ),
                        buildEmail(),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: getProportionateScreenHeight(30),
                            child: ElevatedButton(
                              onPressed: model.busy ? null : forgotPassword,
                              child: Text(
                                'Confirmar',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                      ]),
                ),
              )),
    );
  }
}
