import 'package:flutter/material.dart';
import 'package:poc_ws_app/modules/patient/models/patient.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';

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
        print("segurei!!");
        showAdaptiveActionSheet(
          context: context,
          title: Text('${patient.nome}'),
          actions: <BottomSheetAction>[
            BottomSheetAction(
                title: Text('Editar'),
                onPressed: () {
                  print("editou");
                  Navigator.of(context)
                      .pushNamed("/patient-form", arguments: patient);
                }),
            BottomSheetAction(
                title: Text(
                  'Excluir',
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).errorColor),
                ),
                onPressed: () {
                  print("excluiu");
                  Navigator.of(context).pop(true);
                  Navigator.pushReplacementNamed(context, "/patients");
                }),
          ],
          cancelAction: CancelAction(
              title: Text(
                  'Cancelar')), // onPressed parameter is optional by default will dismiss the ActionSheet
        );
      },
      subtitle: Text('${patient.cpf}'),
    );
  }
}
