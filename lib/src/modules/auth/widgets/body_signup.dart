import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/utils/app-routes.dart';
import 'package:provider/provider.dart';
import 'package:poc_ws_app/src/modules/auth/controllers/auth_controller.dart';
import 'package:poc_ws_app/src/modules/auth/models/signup_request_model.dart';
import 'package:poc_ws_app/src/utils/constants.dart';

class BodySignup extends StatefulWidget {
  BodySignup({Key key}) : super(key: key);

  @override
  _BodySignupState createState() => _BodySignupState();
}

class _BodySignupState extends State<BodySignup> {
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      _formData['name'] = '';
      _formData['email'] = '';
      _formData['password'] = '';
      _formData['confirmPassword'] = '';
    }
  }

  @override
  void initState() {
    super.initState();
    var controller = context.read<AuthController>();
    controller.addListener(() {
      if (controller.stateSignup == AuthState.success) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Usuário cadastro com sucesso!',
            textAlign: TextAlign.center,
            style: TextStyle(color: kPrimaryColor),
          ),
          backgroundColor: kSecondaryColor,
        ));
        Navigator.pushReplacementNamed(context, AppRoutes.AUTH_HOME);
      }
      if (controller.stateSignup == AuthState.error) {
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

  void _requestFocus(FocusNode focusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  Future<void> signup() async {
    var controller = context.read<AuthController>();
    var model = SignupRequestModel(
        name: _formData['name'],
        email: _formData['email'],
        password: _formData['password']);
    await controller.signup(model);
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
        onSaved: (value) => _formData[fieldForm] = value);
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
                SizedBox(
                  height: 20,
                ),
                createTextFormField(
                    fieldForm: 'name',
                    label: 'nome',
                    isPassword: false,
                    focusNode: _nameFocusNode),
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
                createTextFormField(
                    fieldForm: 'confirmPassword',
                    label: 'confirme a senha',
                    isPassword: true,
                    focusNode: _confirmPasswordFocusNode),
                SizedBox(
                  height: 20,
                ),
                    SizedBox(
                  width: double.infinity,
                  child: Consumer<AuthController>(
                    builder: (context, controller, child) {
                      return ElevatedButton(
                        onPressed: controller.stateSignup == AuthState.loading
                            ? null
                            : signup,
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
