import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/config/routes.dart';
import 'package:poc_ws_app/src/modules/auth/stores/auth_store.dart';
import 'package:poc_ws_app/src/utils/theme.dart';
import 'package:asuka/asuka.dart' as asuka show builder;
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>.value(value: AuthStore()),
      ],
      child: MaterialApp(
        title: 'POC WS APP',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        routes: routes,
        builder: asuka.builder,
      ),
    );
  }
}
