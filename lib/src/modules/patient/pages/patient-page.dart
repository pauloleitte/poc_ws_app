import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/modules/patient/widgets/body-patient.dart';
import 'package:poc_ws_app/src/utils/app_routes.dart';
import 'package:poc_ws_app/src/utils/constants.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
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
      ),
      body: BodyPatient(),
    );
  }
}
