import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/show_error.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/size_config.dart';

class Aporte extends StatefulWidget {
  const Aporte({Key key}) : super(key: key);

  @override
  _AporteState createState() => _AporteState();
}

class _AporteState extends State<Aporte> {
  bool loadingAporte = false;
  dynamic aportes;
  String fecha;
  bool loading = true;

  Future<void> _obtenerUsuario() async {
    try {
      final Response response =
          await dioClient.get('$kapiUrl/investment_funds/me');
      setState(() {
        aportes = response.data;
        loading = false;
      });
    } on DioError catch (_) {
      showError("Error del servidor", context);
    }
  }

  @override
  void initState() {
    _obtenerUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(14),
                vertical: getProportionateScreenHeight(14)),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kDisableColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Abre un nuevo fondo",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "Elige el fondo que mejor se adapte a tus necesidades ")
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Fondos Activos",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: kPrimaryColor),
            textAlign: TextAlign.center,
          ),
          // ignore: avoid_unnecessary_containers
          Container(
              child: !loading
                  ? Column(
                      children: [
                        for (var item in aportes)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(14)),
                            child: Fondo(
                                titulo: item["name"] as String,
                                montoInicial: item["init_amount"] as num,
                                montoObjetivo: item["target_amount"] as num,
                                montoMensual: item["montly_amount"] as num,
                                montoActual: item["current_amount"] as num),
                          ),
                      ],
                    )
                  : Cargando())
        ],
      ),
    );
  }
}

class Fondo extends StatelessWidget {
  final String titulo;
  final num montoInicial;
  final num montoObjetivo;
  final num montoMensual;
  final num montoActual;

  const Fondo(
      {this.titulo,
      this.montoInicial,
      this.montoObjetivo,
      this.montoMensual,
      this.montoActual});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          children: [
            Text(
              titulo,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("Monto Inicial : ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  montoInicial.toString(),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("Objetivo  : ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(montoObjetivo.toString())
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("Monto Mensual : ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(montoMensual.toString())
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("Saldo Actual : ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(montoActual.toString())
              ],
            )
          ],
        ),
      ),
    );
  }
}
