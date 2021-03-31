import 'package:flutter/material.dart';
import 'package:poc_ws_app/modules/patient/widgets/body-patient.dart';
import 'package:poc_ws_app/utils/constants.dart';
import 'package:poc_ws_app/utils/size-config.dart';

class PatientPage extends StatelessWidget {
  static String routeName = '/patients';
  const PatientPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Pacientes'),
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: kPrimaryGradientColor),
          )),
      body: BodyPatient(),
    );
  }
}
