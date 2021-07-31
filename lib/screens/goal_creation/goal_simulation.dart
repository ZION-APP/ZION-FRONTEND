import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

class GoalSimulation extends StatefulWidget {
  const GoalSimulation({ Key key }) : super(key: key);

  @override
  _GoalSimulationState createState() => _GoalSimulationState();
}

class _GoalSimulationState extends State<GoalSimulation> {
  String nombreMeta = "Nombre de la meta";
  String fondo = "Omega";
  String montoIni = "\$300.00";
  String montoObj = "\$3000.00";
  String mensualidades = "20";
  String aportMensual = "\$500.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryLightColor,
        ),
        title: const Text(
          'Simulación de meta',
          style: TextStyle(color: kPrimaryLightColor),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      body: SizedBox(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Meta:',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(10)),
                      Text(
                        nombreMeta,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey[200], width: 3),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                      width: getProportionateScreenWidth(320),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey[300])
                              )
                            ),
                            child: SizedBox(
                              width: getProportionateScreenWidth(280),
                              child: Column(
                                children: [
                                  SizedBox(height: getProportionateScreenHeight(25)),
                                  const Text(
                                    'Simulación',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 25,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(15))
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: getProportionateScreenHeight(25)),
                                  const Text(
                                    'Fondo Recomendado',
                                    style: TextStyle(
                                      color: kSecondaryColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(25)),
                                  const Text(
                                    'Monto Inicial',
                                    style: TextStyle(
                                      color: kSecondaryColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(25)),
                                  const Text(
                                    'Monto Objetivo',
                                    style: TextStyle(
                                      color: kSecondaryColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(25)),
                                  const Text(
                                    'Mensualidades',
                                    style: TextStyle(
                                      color: kSecondaryColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                ]
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: getProportionateScreenHeight(25)),
                                  Text(
                                    fondo,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(25)),
                                  Text(
                                    montoIni,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(25)),
                                  Text(
                                    montoObj,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(25)),
                                  Text(
                                    mensualidades,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(50)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  const Text(
                    'Aportación mensual',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 25,
                        ),
                      ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  Text(
                    aportMensual,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(30)),
              child: DefaultButton(
                func: () => {},
                label: "Crear Inversión",
                colorFondo: kPrimaryColor,
                colorTexto: kSecondaryColor,
              ),
            ),
                ],
              )
            )
          ],
        ),
      )
    );
  }
}