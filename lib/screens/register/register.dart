import 'package:zionapp/constants.dart';
import 'package:zionapp/models/tipo_persona.dart';
import 'package:zionapp/screens/register/components.dart/formulario.dart';
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
      body: SizedBox(
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
                hasScrollBody: false,
                child: FormularioRegister(
                  usuarioController: usuarioController,
                  cedulaController: cedulaController,
                  tipoPersona: tipoPersona,
                  correoController: correoController,
                  contrasenaController: contrasenaController,
                  contrasenaConfirmController: contrasenaConfirmController,
                  formKey: _formKey,
                )),
          ],
        ),
      ),
    );
  }
}
