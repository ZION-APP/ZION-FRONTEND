import 'package:flutter/material.dart';
import 'package:zionApp/Constants.dart';

import 'package:zionApp/components/expansion_panelcomp.dart';
import 'package:zionApp/sizeConfig.dart';

class PreguntasF extends StatelessWidget {
  PreguntasF({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryLightColor,
        ),
        title: Text(
          'Preguntas Frecuentes ',
          style: TextStyle(color: kPrimaryLightColor),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              ExpandingItems(
                titulo: "¿Qué es un fondo de inversión administrado?",
                contenido:
                    "Un fondo de inversión es un instrumento de ahorro que reúne a un gran número de personas que quieren invertir su dinero.",
              ),
              ExpandingItems(
                titulo: "¿Que es una administradora de fondos y fideicomisos?",
                contenido:
                    "Son Sociedades Anónimas que se constituyen bajo un objeto social establecido, que es el de administrar los Fondos de Inversión, así como también negocios fiduciarios.También representan Fondos de Inversión Internacionales y actúan como emisores en procesos de titularización",
              ),
              ExpandingItems(
                titulo:
                    "¿Qué institución regula a una administradora de fondos??",
                contenido:
                    "La entidad que controla a las Administradoras de Fondos de Inversión, es la Superintendencia de Compañías, y quien las regula es la Intendencia de Mercado de Valores. ",
              ),
              ExpandingItems(
                titulo: "¿Quiénes participan en un fondo de inversión?",
                contenido:
                    "Los partícipes o clientes, que son las personas que invierten su dinero en el Fondo.La Administradora de Fondos, que es la empresa o entidad autorizada que se encarga de administrar todo el dinero aportado por los partícipes.El Mercado Financiero, Mercado de Valores y Mercado de Capitales, donde se adquieren los Títulos Valores que conforman el Portafolio del Fondo.",
              ),
              ExpandingItems(
                titulo: "¿Quiénes invierten en un fondo de inversión?",
                contenido:
                    "Cualquier persona natural, jurídica (debidamente representada) y asociaciones debidamente legalizadas pueden participar de los Fondos de Inversión. No es necesario tener una gran cantidad de dinero para invertir, ya que existen Fondos de diversos tipos y siempre hay uno que se ajuste a las necesidades y capacidad de ahorro (o de inversión) del cliente.",
              ),
              ExpandingItems(
                titulo: "¿Qué es un portafolio de inversión??",
                contenido:
                    "También llamado Cartera de Inversión, es una selección de documentos o títulos valores que se cotizan en el mercado bursátil y en los que una persona o empresa deciden colocar o invertir su dinero.",
              ),
              ExpandingItems(
                  titulo: "¿Qué es un portafolio de inversión??",
                  contenido:
                      "También llamado Cartera de Inversión, es una selección de documentos o títulos valores que se cotizan en el mercado bursátil y en los que una persona o empresa deciden colocar o invertir su dinero."),
              ExpandingItems(
                  titulo: "¿Qué es un portafolio de inversión??",
                  contenido:
                      "También llamado Cartera de Inversión, es una selección de documentos o títulos valores que se cotizan en el mercado bursátil y en los que una persona o empresa deciden colocar o invertir su dinero."),
              ExpandingItems(
                  titulo: "¿Qué es un portafolio de inversión??",
                  contenido:
                      "También llamado Cartera de Inversión, es una selección de documentos o títulos valores que se cotizan en el mercado bursátil y en los que una persona o empresa deciden colocar o invertir su dinero."),
            ],
          ),
        ),
      ),
    );
  }
}
