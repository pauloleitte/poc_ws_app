import 'package:flutter/material.dart';
import 'package:poc_ws_app/modules/patient/models/patient.dart';

class PatientFormPage extends StatefulWidget {
  static String routeName = '/patient-form';
  const PatientFormPage({Key key}) : super(key: key);

  @override
  _PatientFormPageState createState() => _PatientFormPageState();
}

class _PatientFormPageState extends State<PatientFormPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final patient = ModalRoute.of(context).settings.arguments as Patient;
    print(patient.nome);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PatientFormPage(),
    );
  }
}
