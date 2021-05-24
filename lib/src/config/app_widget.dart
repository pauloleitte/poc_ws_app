import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/config/app_http_client.dart';
import 'package:poc_ws_app/src/config/routes.dart';
import 'package:poc_ws_app/src/modules/auth/controllers/auth_controller.dart';
import 'package:poc_ws_app/src/modules/auth/services/auth_service.dart';
import 'package:poc_ws_app/src/utils/theme.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (_) => AppHttpClient(),
          ),
          Provider(
            create: (context) => AuthService(context.read()),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthController(context.read()),
          ),
        ],
        child: MaterialApp(
          title: 'POC WS APP',
          theme: theme(),
          debugShowCheckedModeBanner: false,
          routes: routes,
        ));
  }
}
