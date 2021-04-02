import 'package:flutter/material.dart';
import 'package:poc_ws_app/modules/patient/models/patient.dart';
import 'package:poc_ws_app/utils/constants.dart';

class PatientFormPage extends StatefulWidget {
  PatientFormPage({Key key}) : super(key: key);

  @override
  _PatientFormPageState createState() => _PatientFormPageState();
}

class _PatientFormPageState extends State<PatientFormPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  final _nomeFocusNode = FocusNode();
  final _idadeFocusNode = FocusNode();
  final _cpfFocusNode = FocusNode();
  final _dataNascFocusNode = FocusNode();
  final _sexoFocusNode = FocusNode();

  final _celularFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  final _cepFocusNode = FocusNode();
  final _enderecoFocusNode = FocusNode();
  final _numeroFocusNode = FocusNode();
  final _bairroFocusNode = FocusNode();
  final _cidadeFocusNode = FocusNode();
  final _estadoFocusNode = FocusNode();

  final _alturaFocusNode = FocusNode();
  final _pesoFocusNode = FocusNode();
  final _tipoSanguineoFocusNode = FocusNode();

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
    print(_formData.toString());
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final patient = ModalRoute.of(context).settings.arguments as Patient;

      if (patient != null) {
        _formData['id'] = patient.id;
        _formData['nome'] = patient.nome;
        _formData['idade'] = patient.idade;
        _formData['cpf'] = patient.cpf;
        _formData['dataNasc'] = patient.dataNasc;
        _formData['sexo'] = patient.sexo;
        _formData['cep'] = patient.cep;
        _formData['endereco'] = patient.endereco;
        _formData['numero'] = patient.numero;
        _formData['bairro'] = patient.bairro;
        _formData['cidade'] = patient.cidade;
        _formData['estado'] = patient.estado;
        _formData['celular'] = patient.celular;
        _formData['email'] = patient.email;
        _formData['altura'] = patient.altura;
        _formData['peso'] = patient.peso;
        _formData['tipoSanguineo'] = patient.tipoSanguineo;
        _formData['imageAvatar'] = patient.imageAvatar;
      } else {
        _formData['id'] = "";
        _formData['nome'] = "";
        _formData['idade'] = "";
        _formData['cpf'] = "";
        _formData['dataNasc'] = "";
        _formData['sexo'] = "";
        _formData['cep'] = "";
        _formData['endereco'] = "";
        _formData['numero'] = "";
        _formData['bairro'] = "";
        _formData['cidade'] = "";
        _formData['estado'] = "";
        _formData['celular'] = "";
        _formData['email'] = "";
        _formData['altura'] = "";
        _formData['peso'] = "";
        _formData['tipoSanguineo'] = "";
        _formData['imageAvatar'] = "";
      }
    }
  }

  Widget createTextFormField(
      {String fieldForm,
      FocusNode focusNode,
      String label,
      TextInputAction textInputAction,
      TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
        onTap: () {
          _requestFocus(focusNode);
        },
        initialValue: _formData[fieldForm].toString(),
        focusNode: focusNode,
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
                color: kSecondaryColor,
                fontWeight:
                    focusNode.hasFocus ? FontWeight.bold : FontWeight.normal)),
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        onSaved: (value) => _formData[fieldForm] = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Paciente'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kPrimaryGradientColor),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              print(_formData.toString());
            },
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            )
          : Padding(
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
                                    child: const Text('Continuar'),
                                  ),
                                  SizedBox(width: 15),
                                  ElevatedButton(
                                    onPressed:
                                        _currentStep == 0 ? null : onStepCancel,
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
                                title: new Text('Dados pessoais'),
                                subtitle: Text('informe os dados pessoais'),
                                content: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'nome',
                                        label: 'nome',
                                        focusNode: _nomeFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'idade',
                                        label: 'idade',
                                        keyboardType: defaultNumberKeyboard,
                                        focusNode: _idadeFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'cpf',
                                        label: 'cpf',
                                        keyboardType: defaultNumberKeyboard,
                                        focusNode: _cpfFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'dataNasc',
                                        label: 'data de nascimento',
                                        keyboardType: defaultNumberKeyboard,
                                        focusNode: _dataNascFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'sexo',
                                        label: 'sexo',
                                        focusNode: _sexoFocusNode),
                                  ],
                                ),
                                isActive: _currentStep >= 0,
                                state: _currentStep >= 0
                                    ? StepState.complete
                                    : StepState.disabled,
                              ),
                              Step(
                                title: new Text('Dados de contato'),
                                subtitle: Text('Informe os para contato'),
                                content: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'celular',
                                        label: 'celular',
                                        keyboardType: TextInputType.phone,
                                        focusNode: _celularFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'email',
                                        label: 'e-mail',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        focusNode: _emailFocusNode),
                                  ],
                                ),
                                isActive: _currentStep >= 0,
                                state: _currentStep >= 2
                                    ? StepState.complete
                                    : StepState.disabled,
                              ),
                              Step(
                                title: Text('Endereço'),
                                subtitle: Text('informe o endereço'),
                                content: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'cep',
                                        label: 'cep',
                                        focusNode: _cepFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'endereco',
                                        label: 'endereço',
                                        focusNode: _enderecoFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'numero',
                                        label: 'número',
                                        focusNode: _numeroFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'bairro',
                                        label: 'bairro',
                                        focusNode: _bairroFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'cidade',
                                        label: 'estado',
                                        focusNode: _cidadeFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'estado',
                                        label: 'estado',
                                        focusNode: _estadoFocusNode),
                                  ],
                                ),
                                isActive: _currentStep >= 0,
                                state: _currentStep >= 1
                                    ? StepState.complete
                                    : StepState.disabled,
                              ),
                              Step(
                                title: new Text('Dados clínicos'),
                                subtitle: Text('Informe os dados clínicos'),
                                content: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'altura',
                                        label: 'altura',
                                        keyboardType: defaultNumberKeyboard,
                                        focusNode: _alturaFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'peso',
                                        label: 'peso',
                                        keyboardType: defaultNumberKeyboard,
                                        focusNode: _pesoFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'tipoSanguineo',
                                        label: 'tipo sanguineo',
                                        keyboardType: defaultNumberKeyboard,
                                        focusNode: _tipoSanguineoFocusNode),
                                  ],
                                ),
                                isActive: _currentStep >= 0,
                                state: _currentStep >= 2
                                    ? StepState.complete
                                    : StepState.disabled,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
    );
  }
}
