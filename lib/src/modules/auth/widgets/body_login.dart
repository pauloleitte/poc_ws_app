import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/config/app_images.dart';
import 'package:poc_ws_app/src/modules/auth/controllers/login_controller.dart';
import 'package:poc_ws_app/src/modules/auth/stores/auth_store.dart';
import 'package:poc_ws_app/src/modules/auth/view-models/login_view_model.dart';
import 'package:poc_ws_app/src/utils/app_routes.dart';
import 'package:poc_ws_app/src/utils/constants.dart';
import 'package:poc_ws_app/src/utils/size_config.dart';
import 'package:provider/provider.dart';

class BodyLogin extends StatefulWidget {
  BodyLogin({Key key}) : super(key: key);

  @override
  _BodyLoginState createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final _form = GlobalKey<FormState>();

  final _controller = LoginController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  var model = LoginViewModel();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> login() {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      setUserState();
    }
  }

  setUserState() async {
    setState(() {});
    var user = await _controller.login(model);
    var store = Provider.of<AuthStore>(context, listen: false);
    store.setUser(user);
    Navigator.popAndPushNamed(context, AppRoutes.HOME);
    setState(() {});
  }

  void _requestFocus(FocusNode focusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  Widget buildEmail() {
    return TextFormField(
        onTap: () {
          _requestFocus(_emailFocusNode);
        },
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

  Widget buildPassword() {
    return TextFormField(
        onTap: () {
          _requestFocus(_passwordFocusNode);
        },
        obscureText: true,
        focusNode: _passwordFocusNode,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: 'senha',
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
                color: kSecondaryColor,
                fontWeight: _passwordFocusNode.hasFocus
                    ? FontWeight.bold
                    : FontWeight.normal)),
        validator: (value) {
          if (value.isEmpty) {
            return 'campo obrigatório';
          }
          return null;
        },
        onSaved: (value) {
          model.password = value;
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
        child: SingleChildScrollView(
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
                  buildEmail(),
                  SizedBox(
                    height: 20,
                  ),
                  buildPassword(),
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
                              Navigator.pushNamed(
                                  context, AppRoutes.AUTH_SIGNUP)
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
                    child: ElevatedButton(
                      onPressed: model.busy ? null : login,
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
