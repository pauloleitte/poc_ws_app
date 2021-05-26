import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/utils/size_config.dart';

const kPrimaryColor = Color(0xFF646ECB);
const kPrimaryLightColor = Color(0xFFFFFFFF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [Color(0xFF646ECB), Color(0xFFA8EB12)],
);
const kSecondaryColor = Color(0xFFFFFFFF);
const kTextColor = Color(0xFFFFFFFF);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
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
  0xFF646ECB,
  const <int, Color>{
    50: const Color(0xFF646ECB),
    100: const Color(0xFF646ECB),
    200: const Color(0xFF646ECB),
    300: const Color(0xFF646ECB),
    400: const Color(0xFF646ECB),
    500: const Color(0xFF646ECB),
    600: const Color(0xFF646ECB),
    700: const Color(0xFF646ECB),
    800: const Color(0xFF646ECB),
    900: const Color(0xFF646ECB),
  },
);
