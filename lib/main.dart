import 'package:flutter/material.dart';
import 'package:poc_ws_app/config/routes.dart';
import 'package:poc_ws_app/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POC WS APP',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
