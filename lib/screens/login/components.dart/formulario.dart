import 'package:flutter/material.dart';
import 'package:zionapp/components/input_default.dart';
import 'package:zionapp/size_config.dart';

// ignore: must_be_immutable
class FormularioLogin extends StatefulWidget {
  TextEditingController usuarioController;
  TextEditingController contrasenaController;
  Function recuerdameCallback;
  bool recuerdame;
  GlobalKey<FormState> formKey;
  FormularioLogin(
      {this.usuarioController,
      this.contrasenaController,
      this.recuerdame,
      this.formKey,
      this.recuerdameCallback});

  @override
  _FormularioLoginState createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(14)),
                child: DefaultInput(
                  key: const ValueKey('loginUserName'),
                  controller: widget.usuarioController,
                  isContrasena: false,
                  //validacion: Validadores.validarCorreo,
                  label: "Nombre de Usuario",
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(14)),
            child: DefaultInput(
              key: const ValueKey('loginPass'),
              controller: widget.contrasenaController,
              isContrasena: true,
              label: "Contraseña",
            ),
          ),
        ],
      ),
    );
  }
}
