import 'package:flutter/material.dart';
import 'package:poc_ws_app/data/DATA_PATIENT.dart';
import 'package:poc_ws_app/modules/patient/widgets/patient-item.dart';

class BodyPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final patients = PATIENTS_DATA;
    return ListView.builder(
      itemCount: patients.length,
      itemBuilder: (ctx, i) => Column(
        children: <Widget>[
          PatientItem(patients[i]),
          Divider(),
        ],
      ),
    );
  }
}
