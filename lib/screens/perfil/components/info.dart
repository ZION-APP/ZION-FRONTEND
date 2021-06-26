import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/sizeConfig.dart';

// ignore: must_be_immutable
class InfoPerfil extends StatelessWidget {
  dynamic usuario;
  InfoPerfil(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryLightColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(15)),
        child: Column(
          children: [
            _mostrarDetalle(
                "Usuario", usuario["usuario"]["usuario"] ?? "Sin especificar"),
            _mostrarDetalle("Correo electronico",
                usuario["usuario"]["correo"] ?? "Sin especificar"),
            _mostrarDetalle(
                "Cedula identidad", usuario["cedula"] ?? "Sin especificar"),
            _mostrarDetalle("Numero de celular",
                usuario["usuario"]["celular"] ?? "Sin especificar")
          ],
        ),
      ),
    );
  }

  Widget _mostrarDetalle(String titulo, dynamic descripcion) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(
              color: kSecondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenHeight(15)),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: getProportionateScreenHeight(4),
              bottom: getProportionateScreenHeight(15)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: kDisableColor, width: getProportionateScreenHeight(1)),
            ),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(8),
                  horizontal: getProportionateScreenWidth(10)),
              child: Text(
                descripcion,
                style: TextStyle(fontSize: getProportionateScreenHeight(14)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
