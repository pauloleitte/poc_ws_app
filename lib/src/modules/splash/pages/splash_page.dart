import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/config/app_images.dart';
import 'package:poc_ws_app/src/utils/app_routes.dart';
import 'package:poc_ws_app/src/utils/constants.dart';
import 'package:poc_ws_app/src/utils/size_config.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacementNamed(context, AppRoutes.AUTH_HOME),
    );
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: Center(
          child: Image.asset(
            AppImages.logo,
          ),
        ),
      ),
    );
  }
}
