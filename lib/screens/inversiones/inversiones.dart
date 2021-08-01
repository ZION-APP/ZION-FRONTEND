import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/routes/router.gr.dart';
import 'package:zionapp/screens/inversiones/components/fondo_card.dart';
import 'package:zionapp/size_config.dart';

class InversionesHome extends StatefulWidget {
  @override
  _InversionesState createState() => _InversionesState();
}

class _InversionesState extends State<InversionesHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(40)),
                  const Text(
                    'Seleccione un fondo a invertir',
                    style: TextStyle(fontSize: 21),
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  const FondoCard(tipo: "alpha"),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  const FondoCard(tipo: "omega")
                ],
              ))
        ],
      ),
    );
  }
}
