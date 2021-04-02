import 'package:flutter/material.dart';
import 'package:poc_ws_app/modules/patient/widgets/body-patient.dart';
import 'package:poc_ws_app/utils/app-routes.dart';
import 'package:poc_ws_app/utils/constants.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Pacientes"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PATIENT_FORM);
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: kPrimaryGradientColor),
          )),
      body: BodyPatient(),
    );
  }
}
