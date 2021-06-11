import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/sizeConfig.dart';

class BuzonCard extends StatelessWidget {
  final dynamic noticia;
  BuzonCard({@required this.noticia});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(5),
          vertical: getProportionateScreenHeight(2)),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(12),
              horizontal: getProportionateScreenWidth(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: imagen(this.noticia["imagenes"]),
                    fit: FlexFit.tight,
                  ),
                  Flexible(
                    flex: 3,
                    child: textPublicacion(),
                    fit: FlexFit.tight,
                  ),
                ],
              ),
              fechaPublicacion(this.noticia["CreatedAt"]),
              _autor(this.noticia["usuario"]["nombres"])
            ],
          ),
        ),
      ),
    );
  }

  Widget imagen(dynamic imagen) {
    try {
      dynamic src = imagen[0];
      return Image.network(src["imagen"]);
    } catch (e) {
      return Image.network("https://practical.com.ec/assets/images/Logo-2.png");
    }
  }

  Padding textPublicacion() {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titulo(this.noticia["titulo"]),
          _descripcion(this.noticia["cuerpo"]),
        ],
      ),
    );
  }

  Widget _titulo(String titulo) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        titulo ?? "No hay titulo",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _descripcion(String descripcion) {
    return Text(descripcion ?? "Sin descripcion");
  }

  Widget _autor(String autor) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(12)),
              children: [
            TextSpan(text: "Autor,\n", style: TextStyle(color: Colors.black)),
            TextSpan(
                text: autor ?? "Sin autor",
                style: TextStyle(color: kPrimaryColor))
          ])),
    );
  }

  Widget fechaPublicacion(String fecha) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(12)),
              children: [
            TextSpan(
                text: "Fecha publicacion \t",
                style: TextStyle(color: Colors.black)),
            TextSpan(
                text: fecha.split('T')[0] ?? "Sin Fecha",
                style: TextStyle(color: kPrimaryColor))
          ])),
    );
  }
}
