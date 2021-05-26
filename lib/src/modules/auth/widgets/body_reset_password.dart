import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/config/app_images.dart';
import 'package:poc_ws_app/src/utils/app_routes.dart';
import 'package:poc_ws_app/src/utils/constants.dart';

class BodyResetPassword extends StatefulWidget {
  BodyResetPassword({Key key}) : super(key: key);

  @override
  _BodyResetPasswordState createState() => _BodyResetPasswordState();
}

class _BodyResetPasswordState extends State<BodyResetPassword> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: kPrimaryColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppImages.email,
                  height: 70,
                  width: 70,
                ),
              ),
              Text(
                'Check seu e-mail',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text('Enviamos instruções de recuperação de senha.'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text(
                  'Tenho um código',
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Text('Não recebeu o e-mail? Verifique seu filtro de spam ou '),
              InkWell(
                child: Text(
                  'tente outro endereço de e-mail.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => {
                  Navigator.popAndPushNamed(context, AppRoutes.AUTH_FORGOT_PASSWORD)
                },
              ),
            ]),
      ),
    );
  }
}
