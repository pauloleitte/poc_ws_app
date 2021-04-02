import 'package:flutter/material.dart';
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
                  'https://jpimg.com.br/uploads/2020/07/cristiano-ronaldo-tem-feito-grande-temporada-pela-juventus-1024x625.jpg',
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
                Navigator.of(context).pushNamed('/patients');
              },
            ),
          ],
        ),
      ),
    );
  }
}
