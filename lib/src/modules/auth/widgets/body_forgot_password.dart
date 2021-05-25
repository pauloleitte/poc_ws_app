import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/modules/auth/models/forgot_password_request_model.dart';
import 'package:poc_ws_app/src/utils/app-routes.dart';
import 'package:provider/provider.dart';
import 'package:poc_ws_app/src/modules/auth/controllers/auth_controller.dart';
import 'package:poc_ws_app/src/utils/constants.dart';
import 'package:poc_ws_app/src/utils/size-config.dart';

class BodyForgotPassword extends StatefulWidget {
  BodyForgotPassword({Key key}) : super(key: key);

  @override
  _BodyForgotPasswordState createState() => _BodyForgotPasswordState();
}

class _BodyForgotPasswordState extends State<BodyForgotPassword> {
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  final _emailFocusNode = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      _formData['email'] = '';
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    var controller = context.read<AuthController>();
    controller.addListener(() {
      if (controller.stateForgotPassword == AuthState.success) {
        Navigator.pushReplacementNamed(context, AppRoutes.AUTH_RESET_PASSWORD);
      }
      if (controller.stateForgotPassword == AuthState.error) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Erro ao realizar o envio do e-mail por favor tente novamente.',
            textAlign: TextAlign.center,
            style: TextStyle(color: kPrimaryColor),
          ),
          backgroundColor: kSecondaryColor,
        ));
      }
    });
  }

  Future<void> forgotPassword() async {
    var controller = context.read<AuthController>();
    var model = ForgotPasswordRequestModel(email: _formData['email']);
    await controller.forgotPassword(model);
  }

  Widget createTextFormField(
      {String fieldForm,
      FocusNode focusNode,
      String label,
      TextInputAction textInputAction,
      TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
        initialValue: _formData[fieldForm].toString(),
        focusNode: focusNode,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
                color: kSecondaryColor,
                fontWeight:
                    focusNode.hasFocus ? FontWeight.bold : FontWeight.normal)),
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        onChanged: (value) {
          _formData[fieldForm] = value;
        },
        onSaved: (value) {
          _formData[fieldForm] = value;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: kPrimaryColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                createTextFormField(
                  fieldForm: 'email',
                  label: 'email',
                  focusNode: _emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(30),
                  child: Consumer<AuthController>(
                    builder: (context, controller, child) {
                      return ElevatedButton(
                        onPressed:
                            controller.stateForgotPassword == AuthState.loading
                                ? null
                                : forgotPassword,
                        child: Text('Confirmar'),
                      );
                    },
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
