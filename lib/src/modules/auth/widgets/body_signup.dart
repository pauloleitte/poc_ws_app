import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/modules/auth/controllers/signup_controller.dart';
import 'package:poc_ws_app/src/modules/auth/view-models/signup_view_model.dart';
import 'package:poc_ws_app/src/utils/constants.dart';

class BodySignup extends StatefulWidget {
  BodySignup({Key key}) : super(key: key);

  @override
  _BodySignupState createState() => _BodySignupState();
}

class _BodySignupState extends State<BodySignup> {
  final _form = GlobalKey<FormState>();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  final _passwordController = TextEditingController();

  final _controller = SignupController();

  var model = SignupViewModel();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  void _requestFocus(FocusNode focusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  Future<void> signup() async {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      setState(() {});
      var result = await _controller.signup(model);
      debugPrint(result.toString());
      setState(() {});
    }
  }

  bool isEmail(String value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(regex);

    return value.isNotEmpty && regExp.hasMatch(value);
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
          if (!isEmail(value)) {
            return 'Informe um e-mail válido';
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
        controller: _passwordController,
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

  Widget buildConfirmPassword() {
    return TextFormField(
        onTap: () {
          _requestFocus(_confirmPasswordFocusNode);
        },
        obscureText: true,
        focusNode: _confirmPasswordFocusNode,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: 'senha',
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
                color: kSecondaryColor,
                fontWeight: _confirmPasswordFocusNode.hasFocus
                    ? FontWeight.bold
                    : FontWeight.normal)),
        validator: (value) {
          if (value.isEmpty) {
            return 'campo obrigatório';
          }
          if (value.isNotEmpty) {
            if (value != _passwordController.text) {
              return 'As senhas não correspondem.';
            }
            return null;
          }
        },
        onSaved: (value) {
          model.confirmPassword = value;
        });
  }

  Widget buildName() {
    return TextFormField(
        onTap: () {
          _requestFocus(_nameFocusNode);
        },
        focusNode: _nameFocusNode,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: 'nome',
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
                color: kSecondaryColor,
                fontWeight: _nameFocusNode.hasFocus
                    ? FontWeight.bold
                    : FontWeight.normal)),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value.isEmpty) {
            return 'campo obrigatório';
          }
          return null;
        },
        onSaved: (value) {
          model.name = value;
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
                buildName(),
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
                buildConfirmPassword(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: model.busy ? null : signup,
                      child: Text(
                        'Confirmar',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                    )),
              ]),
        ),
      ),
    );
  }
}
