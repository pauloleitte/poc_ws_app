import 'package:flutter/material.dart';
import 'package:poc_ws_app/utils/app-routes.dart';
import 'package:poc_ws_app/utils/constants.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kPrimaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Cristiano Ronaldo'),
              accountEmail: Text('cris@cris.com'),
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  'http://localhost:3000/api/v1/files/565af4a3f2c696a1d3f001b636c72bd5-pinterest_board_photo.png',
                  height: 150.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: kSecondaryColor,
              ),
              title: Text('Home'),
              subtitle: Text('tela inicial'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.people, color: kSecondaryColor),
              title: Text('Pacientes'),
              subtitle: Text('pacientes'),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.PATIENTS);
              },
            ),
          ],
        ),
      ),
    );
  }
}
