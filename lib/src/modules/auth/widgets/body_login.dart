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

  @override
  void initState() {
    super.initState();
    var controller = context.read<AuthController>();
    controller.addListener(() {
      if (controller.stateLogin == AuthState.success) {
        Navigator.pushReplacementNamed(context, AppRoutes.HOME);
      }
      if (controller.stateLogin == AuthState.error) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Erro ao realizar a autenticação por favor tente novamente.',
            textAlign: TextAlign.center,
            style: TextStyle(color: kPrimaryColor),
          ),
          backgroundColor: kSecondaryColor,
        ));
      }
    });
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
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          child: Text('Não tenho uma conta'),
                          onTap: () => {
                            Navigator.pushNamed(context, AppRoutes.AUTH_SIGNUP)
                          },
                        ),
                      ),
                      InkWell(
                        child: Text('Esqueci minha senha'),
                        onTap: () => {
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.AUTH_FORGOT_PASSWORD)
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(30),
                  child: Consumer<AuthController>(
                    builder: (context, controller, child) {
                      return ElevatedButton(
                        onPressed: controller.stateLogin == AuthState.loading
                            ? null
                            : login,
                        child: Text('Entrar'),
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
