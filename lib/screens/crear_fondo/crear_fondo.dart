import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/components/date_picker_default.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/screens/crear_fondo/componentes/fondo_form.dart';
import 'package:zionapp/size_config.dart';

// ignore: must_be_immutable
class CreacionFondo extends StatefulWidget {
  String tipo;
  CreacionFondo({this.tipo, Key key}) : super(key: key);

  @override
  _CreacionFondoState createState() => _CreacionFondoState();
}

class _CreacionFondoState extends State<CreacionFondo> {
  final formFondo = FondoForm();
  List<DropdownMenuItem> fondosList;
  List<DropdownMenuItem> metas;
  List<DropdownMenuItem> cuentas;

  bool _loading = true;
  @override
  void initState() {
    iniciar();
    // TODO: implement initState
    super.initState();
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
          : Theme(
              data: ThemeData(
                  primarySwatch: MaterialColor(0xFFD0AF68, colorPrimary)),
              child: ListView(
                children: [
                  Container(
                      color: kSecondaryColor,
                      height: SizeConfig.screenHeight * 0.10,
                      child:
                          Image.asset(fondos[widget.tipo]["imagen"] as String)),
                  ReactiveForm(
                      formGroup: formFondo.form,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(50),
                            vertical: getProportionateScreenHeight(40)),
                        child: Column(
                          children: [
                            ReactiveTextField(
                              formControlName: "name",
                              decoration:
                                  inputDecoration(context, 'Nombre del fondo'),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            ReactiveDropdownField(
                              formControlName: "fund_id",
                              items: fondosList,
                              decoration: inputDecoration(
                                  context, "Seleccione un fondo"),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            ReactiveDropdownField(
                              formControlName: "goal_id",
                              items: metas,
                              decoration: inputDecoration(
                                  context, "Seleccione una meta"),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            ReactiveDropdownField(
                              isExpanded: true,
                              formControlName: "bank_account_id",
                              items: cuentas,
                              decoration: inputDecoration(
                                  context, "Seleccione una cuenta bancaria"),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            ReactiveTextField<double>(
                              formControlName: "init_amount",
                              decoration:
                                  inputDecoration(context, 'Monto inicial'),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            ReactiveTextField<double>(
                              formControlName: "target_amount",
                              decoration:
                                  inputDecoration(context, 'Monto objetivo'),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            const DatePickerDefault(
                              control: "target_date",
                              labelText: "Fecha hasta su objetivo",
                            ),
                            ReactiveFormConsumer(
                                builder: (context, form, child) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(20)),
                                child: DefaultButton(
                                    label: "Invertir",
                                    colorFondo: formFondo.form.valid
                                        ? kSecondaryColor
                                        : kDisableColor,
                                    func: formFondo.form.valid ? submit : null),
                              );
                            })
                          ],
                        ),
                      )),
                ],
              ),
            ),
    );
  }

  Future<void> submit() async {
    setState(() {
      _loading = true;
    });
    await formFondo.submit(context);
    setState(() {
      _loading = false;
    });
  }

  Future<void> iniciar() async {
    final snapshot = await Future.wait<dynamic>([
      formFondo.getPerfil(context, widget.tipo),
      formFondo.getTipoFondos(context),
      formFondo.getMetas(context),
      formFondo.getCuentasBancarias(context)
    ]);
    fondosList = snapshot[1] as List<DropdownMenuItem>;
    metas = snapshot[2] as List<DropdownMenuItem>;
    cuentas = snapshot[3] as List<DropdownMenuItem>;
    setState(() {
      _loading = false;
    });
  }
}
