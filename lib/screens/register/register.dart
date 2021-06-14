import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/components/button_default.dart';
import 'package:zionApp/components/cargando.dart';
import 'package:zionApp/models/tipoPersona.dart';
import 'package:zionApp/routes/router.gr.dart';
import 'package:zionApp/screens/register/components.dart/formulario.dart';
import 'package:zionApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final cedulaController = TextEditingController();
  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();
  final contrasenaConfirmController = TextEditingController();
  TipoPersona tipoPersona;

  final List<String> tiposPersona = ['Persona natural', 'Persona jurídica'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryLightColor,
        ),
        title: Text(
          'Registro de Usuario',
          style: TextStyle(color: kPrimaryLightColor),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _botones(),
        ),
      ),
    );
  }

  List<Widget> _botones() {
    return [
      SizedBox(height: getProportionateScreenHeight(40)),
      Flexible(
          flex: 5,
          child: FormularioRegister(
            usuarioController: usuarioController,
            cedulaController: cedulaController,
            tipoPersona: tipoPersona,
            correoController: correoController,
            contrasenaController: contrasenaController,
            contrasenaConfirmController: contrasenaConfirmController,
          )),
      Flexible(
        flex: 1,
        child: Container(
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(30)),
            child: DefaultButton(
              func: () => ({print(usuarioController.text + ' ' + cedulaController.text + ' ' + tipoPersona.toString() + ' '
                            + correoController.text + ' ' + contrasenaController.text + ' ' + contrasenaConfirmController.text)}),
              label: "Registrar cuenta",
              colorFondo: kPrimaryColor,
              colorTexto: kSecondaryColor,
            ),
          ),
        ),
      ),
    ];
  }
}
