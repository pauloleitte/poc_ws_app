import 'package:flutter/material.dart';
import 'package:poc_ws_app/config/app_images.dart';
import 'package:poc_ws_app/utils/constants.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryColor,
        child: Center(
          child: Image.asset(
            AppImages.logo,
          ),
        ));
  }
}
