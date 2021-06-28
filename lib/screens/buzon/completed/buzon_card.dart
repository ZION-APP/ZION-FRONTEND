import 'package:flutter/material.dart';
import 'package:zionApp/constants.dart';
import 'package:zionApp/size_config.dart';

class BuzonCard extends StatelessWidget {
  final dynamic noticia;
  const BuzonCard({@required this.noticia});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(5),
          vertical: getProportionateScreenHeight(2)),
      child: Card(
        elevation: 10,
        shape: const RoundedRectangleBorder(
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
                    fit: FlexFit.tight,
                    child: imagen(noticia["imagenes"]),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: textPublicacion(),
                  ),
                ],
              ),
              fechaPublicacion(noticia["CreatedAt"] as String),
              _autor(noticia["usuario"]["nombres"] as String)
            ],
          ),
        ),
      ),
    );
  }

  Widget imagen(dynamic imagen) {
    try {
      final src = imagen[0];
      return Image.network(src["imagen"] as String);
    } catch (e) {
      return Image.network("https://practical.com.ec/assets/images/Logo-2.png");
    }
  }

  Padding textPublicacion() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titulo(noticia["titulo"] as String),
          _descripcion(noticia["cuerpo"] as String),
        ],
      ),
    );
  }

  Widget _titulo(String titulo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        titulo ?? "No hay titulo",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _descripcion(String descripcion) {
    return Text(descripcion ?? "Sin descripcion");
  }

  Widget _autor(String autor) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(12)),
              children: [
            const TextSpan(text: "Autor,\n", style: TextStyle(color: Colors.black)),
            TextSpan(
                text: autor ?? "Sin autor",
                style: const TextStyle(color: kPrimaryColor))
          ])),
    );
  }

  Widget fechaPublicacion(String fecha) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(12)),
              children: [
            const TextSpan(
                text: "Fecha publicacion \t",
                style: TextStyle(color: Colors.black)),
            TextSpan(
                text: fecha.split('T')[0] ?? "Sin Fecha",
                style: const TextStyle(color: kPrimaryColor))
          ])),
    );
  }
}
