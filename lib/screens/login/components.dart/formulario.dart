import 'package:flutter/material.dart';
import 'package:zionapp/constants.dart';
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
                    horizontal: getProportionateScreenWidth(50)),
                child: DefaultInput(
                  controller: widget.usuarioController,
                  isContrasena: false,
                  //validacion: Validadores.validarCorreo,
                  label: "Correo electronico",
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50)),
            child: DefaultInput(
              controller: widget.contrasenaController,
              isContrasena: true,
              label: "Contrasena",
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          _recuerdame()
        ],
      ),
    );
  }

  Widget _recuerdame() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: widget.recuerdame,
            activeColor: kPrimaryColor,
            onChanged: widget.recuerdameCallback as void Function(bool)),
        const Text("Recuerdame")
      ],
    );
  }
}
