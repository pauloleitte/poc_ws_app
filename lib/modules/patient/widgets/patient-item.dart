import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poc_ws_app/modules/patient/models/patient.dart';
import 'package:poc_ws_app/utils/app-routes.dart';

class PatientItem extends StatelessWidget {
  final Patient patient;

  PatientItem(this.patient);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(patient.imageAvatar),
      ),
      title: Text(patient.nome),
      onLongPress: () {
        final action = CupertinoActionSheet(
          title: Text(
            patient.nome,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          message: Text(
            "O que deseja fazer?",
            style: TextStyle(fontSize: 18.0),
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text(
                "Editar",
                style: TextStyle(color: Colors.blue),
              ),
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .pushNamed(AppRoutes.PATIENT_FORM, arguments: patient);
              },
            ),
            CupertinoActionSheetAction(
              child: Text(
                "Excluir",
                style: TextStyle(color: Theme.of(context).errorColor),
              ),
              isDestructiveAction: true,
              onPressed: () {
                print("Action 2 is been clicked");
                Navigator.pop(context);
              },
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text(
              "Cancelar",
              style: TextStyle(color: Colors.lightBlue),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
        showCupertinoModalPopup(context: context, builder: (context) => action);
      },
      subtitle: Text('${patient.cpf}'),
    );
  }
}
