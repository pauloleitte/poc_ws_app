import 'package:flutter/material.dart';
import 'package:poc_ws_app/utils/size-config.dart';

const kPrimaryColor = Color(0xFFFFFFFF);
const kPrimaryLightColor = Color(0xFFA067FF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [Color(0xFF8E26EB), Colors.black],
);
const kSecondaryColor = Color(0xFFA067F0);
const kTextColor = Color(0xFFA067FF);
const kBlackColor = Colors.black;

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

const MaterialColor purple = const MaterialColor(
  0xFFA067FF,
  const <int, Color>{
    50: const Color(0xFFA067FF),
    100: const Color(0xFFA067FF),
    200: const Color(0xFFA067FF),
    300: const Color(0xFFA067FF),
    400: const Color(0xFFA067FF),
    500: const Color(0xFFA067FF),
    600: const Color(0xFFA067FF),
    700: const Color(0xFFA067FF),
    800: const Color(0xFFA067FF),
    900: const Color(0xFFA067FF),
  },
);
