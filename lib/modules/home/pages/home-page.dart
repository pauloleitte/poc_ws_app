import 'package:flutter/material.dart';
import 'package:poc_ws_app/modules/home/widgets/body-home.dart';
import 'package:poc_ws_app/modules/home/widgets/drawer-home.dart';
import 'package:poc_ws_app/utils/app-routes.dart';
import 'package:poc_ws_app/utils/constants.dart';
import 'package:poc_ws_app/utils/size-config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Home"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app_sharp),
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.AUTH_HOME);
              },
            )
          ]),
      body: BodyHome(),
      drawer: DrawerHome(),
    );
  }
}
