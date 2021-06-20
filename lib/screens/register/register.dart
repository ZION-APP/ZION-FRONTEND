import 'package:zionApp/constants.dart';
import 'package:zionApp/models/tipo_persona.dart';
import 'package:zionApp/screens/register/components.dart/formulario.dart';
import 'package:zionApp/size_config.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryLightColor,
        ),
        title: const Text(
          'Registro de Usuario',
          style: TextStyle(color: kPrimaryLightColor),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Column(
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
          formKey: _formKey,
        )
      ),
    ];
  }
}
