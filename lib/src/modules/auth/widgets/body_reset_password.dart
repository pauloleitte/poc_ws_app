import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poc_ws_app/src/utils/constants.dart';

class BodyResetPassword extends StatefulWidget {
  BodyResetPassword({Key key}) : super(key: key);

  @override
  _BodyResetPasswordState createState() => _BodyResetPasswordState();
}

class _BodyResetPasswordState extends State<BodyResetPassword> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  final _tokenFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  final defaultNumberKeyboard = TextInputType.numberWithOptions(decimal: true);

  bool _isLoading = false;

  void _requestFocus(FocusNode focusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if (_currentStep == 2) {}
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget createTextFormField(
      {String fieldForm,
      FocusNode focusNode,
      String label,
      bool isPassword,
      TextInputAction textInputAction,
      TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
        onTap: () {
          _requestFocus(focusNode);
        },
        initialValue: _formData[fieldForm].toString(),
        focusNode: focusNode,
        obscureText: isPassword,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
                color: kSecondaryColor,
                fontWeight:
                    focusNode.hasFocus ? FontWeight.bold : FontWeight.normal)),
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        onChanged: (value) {
          _formData[fieldForm] = value;
        },
        onSaved: (value) => _formData[fieldForm] = value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
          key: _form,
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Stepper(
                    controlsBuilder: (BuildContext context,
                        {VoidCallback onStepContinue,
                        VoidCallback onStepCancel}) {
                      return Row(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: onStepContinue,
                            child: _currentStep == 2
                                ? Text('Salvar')
                                : Text('Continuar'),
                          ),
                          SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: _currentStep == 0 ? null : onStepCancel,
                            child: const Text('Cancelar'),
                          ),
                        ],
                      );
                    },
                    type: stepperType,
                    physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: continued,
                    onStepCancel: cancel,
                    steps: <Step>[
                      Step(
                        title: new Text('Token'),
                        subtitle: Text('informe os dados pessoais'),
                        content: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            createTextFormField(
                                fieldForm: 'token',
                                label: 'token',
                                isPassword: false,
                                focusNode: _tokenFocusNode),
                            SizedBox(
                              height: 20,
                            ),
                            createTextFormField(
                                fieldForm: 'password',
                                label: 'senha',
                                isPassword: true,
                                focusNode: _passwordFocusNode),
                            SizedBox(
                              height: 20,
                            ),
                            createTextFormField(
                                fieldForm: 'confirmPassword',
                                label: 'confirme a senha',
                                isPassword: true,
                                focusNode: _confirmPasswordFocusNode),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
