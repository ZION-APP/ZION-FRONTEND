import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/constants_config.dart';
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
                SizedBox(
                  width: 350,
                  child: Column(
                    children: [
                      Image.asset("assets/img/inversion_alpha_banner.PNG"),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kSecondaryColor, width: 4)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: getProportionateScreenWidth(20),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: getProportionateScreenHeight(5)),
                                    const Text(
                                      'Rendimiento promedio: 4.91%',
                                      style: TextStyle(
                                        color: kSecondaryColor,
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(height: getProportionateScreenHeight(5)),
                                    const Text(
                                      'Permanencia mínima: 32 días',
                                      style: TextStyle(
                                        color: kSecondaryColor,
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(height: getProportionateScreenHeight(5)),
                                    const Text(
                                      'Inversión inicial: \$100',
                                      style: TextStyle(
                                        color: kSecondaryColor,
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: getProportionateScreenWidth(10),),
                                Image.asset('assets/img/certificacion_zion.PNG')
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(30)),
                              child: DefaultButton(
                                func: () => {},
                                label: "Invertir en este fondo",
                                colorFondo: kPrimaryColor,
                                colorTexto: kSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(40),),
                      Image.asset("assets/img/inversion_omega_banner.PNG"),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kSecondaryColor, width: 4)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: getProportionateScreenWidth(20),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: getProportionateScreenHeight(5)),
                                    const Text(
                                      'Rendimiento promedio: 6.08%',
                                      style: TextStyle(
                                        color: kSecondaryColor,
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(height: getProportionateScreenHeight(5)),
                                    const Text(
                                      'Permanencia mínima: 365 días',
                                      style: TextStyle(
                                        color: kSecondaryColor,
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(height: getProportionateScreenHeight(5)),
                                    const Text(
                                      'Inversión inicial: \$100',
                                      style: TextStyle(
                                        color: kSecondaryColor,
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: getProportionateScreenWidth(10),),
                                Image.asset('assets/img/certificacion_zion.PNG')
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(30)),
                              child: DefaultButton(
                                func: () => {},
                                label: "Invertir en este fondo",
                                colorFondo: kPrimaryColor,
                                colorTexto: kSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
