import 'package:flutter/material.dart';
import 'package:poc_ws_app/config/routes.dart';
import 'package:poc_ws_app/modules/home/pages/home-page.dart';
import 'package:poc_ws_app/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
