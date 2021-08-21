import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/components/input_default.dart';
import 'package:zionapp/components/show_error.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/routes/router.gr.dart';
import 'package:zionapp/size_config.dart';

// ignore: must_be_immutable
class CreacionFondo extends StatefulWidget {
  String tipo;
  CreacionFondo({this.tipo, Key key}) : super(key: key);

  @override
  _CreacionFondoState createState() => _CreacionFondoState();
}

class _CreacionFondoState extends State<CreacionFondo> {
  final _formKey = GlobalKey<FormState>();
  final _metaController = TextEditingController();
  final _montoInicial = TextEditingController();
  final _aportacionMensual = TextEditingController();
  final _cuentaADebitar = TextEditingController();
  bool _loading = true;
  @override
  void initState() {
    getPerfil();
    // TODO: implement initState
    super.initState();
  }

  Future<void> getPerfil() async {
    try {
      final response = await dioClient.get("$kapiUrl/users/me");
      if (!(response.data["is_form_complete"] as bool)) {
        await AutoRouter.of(context).replace(const FormularioRoute());
      }
    } on DioError catch (e) {
      print(e.response);
      showError("Error del servidor", context);
      await AutoRouter.of(context).pop();
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creacion de fondo"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: _loading
          ? Cargando()
          : ListView(
              children: [
                Container(
                    color: kSecondaryColor,
                    height: SizeConfig.screenHeight * 0.10,
                    child:
                        Image.asset(fondos[widget.tipo]["imagen"] as String)),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        input(_metaController, "Meta a seleccionar"),
                        input(_montoInicial, "Seleccione monto inicial",
                            inputType: TextInputType.number),
                        input(_aportacionMensual, "Aportacion mensual",
                            inputType: TextInputType.number),
                        input(
                          _cuentaADebitar,
                          "Cuenta a debitar",
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(20)),
                          child: DefaultButton(
                            label: "Invertir",
                            func: () {
                              AutoRouter.of(context)
                                  .push(const FormularioRoute());
                            },
                          ),
                        )
                      ],
                    )),
              ],
            ),
    );
  }

  Widget input(TextEditingController _controller, String label,
      {TextInputType inputType}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(15),
          horizontal: getProportionateScreenWidth(15)),
      child: DefaultInput(
        controller: _controller,
        isContrasena: false,
        label: label,
        inputType: inputType,
      ),
    );
  }
}
