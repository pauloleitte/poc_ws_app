import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:poc_ws_app/src/config/app_images.dart';
import 'package:poc_ws_app/src/modules/auth/controllers/auth_controller.dart';
import 'package:poc_ws_app/src/modules/auth/models/login_request_model.dart';
import 'package:poc_ws_app/src/utils/app-routes.dart';
import 'package:poc_ws_app/src/utils/constants.dart';
import 'package:poc_ws_app/src/utils/size-config.dart';

class BodyLogin extends StatefulWidget {
  BodyLogin({Key key}) : super(key: key);

  @override
  _BodyLoginState createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      _formData['email'] = '';
      _formData['password'] = '';
    }
  }

  Future<void> login() async {
    var controller = context.read<AuthController>();
    var model = LoginRequestModel(
        email: _formData['email'], password: _formData['password']);
    await controller.login(model);
  }

  void _requestFocus(FocusNode focusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  Widget createTextFormField(
      {String fieldForm,
      FocusNode focusNode,
      String label,
      bool isPassword,
      TextInputAction textInputAction,
      TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
        onTap: () {
          _requestFocus(focusNode);
        },
        initialValue: _formData[fieldForm].toString(),
        focusNode: focusNode,
        obscureText: isPassword,
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
          print(value);
          _formData[fieldForm] = value;
        },
        onSaved: (value) {
          print(value);
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
                Center(
                  child: Image.asset(
                    AppImages.logo,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                createTextFormField(
                    fieldForm: 'email',
                    label: 'email',
                    keyboardType: TextInputType.emailAddress,
                    isPassword: false,
                    focusNode: _emailFocusNode),
                SizedBox(
                  height: 20,
                ),
                createTextFormField(
                    fieldForm: 'password',
                    label: 'senha',
                    isPassword: true,
                    focusNode: _passwordFocusNode),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Text('Não tem uma conta? Clique aqui!'),
                  onTap: () =>
                      {Navigator.pushNamed(context, AppRoutes.AUTH_SIGNUP)},
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(30),
                  child: ElevatedButton(
                    onPressed: login,
                    child: Text('Entrar'),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
