import 'package:flutter/material.dart';
import 'package:zionApp/constants.dart';
import 'package:zionApp/components/button_default.dart';
import 'package:zionApp/components/input_default.dart';
import 'package:zionApp/size_config.dart';
import 'package:zionApp/validator/validator.dart';

class FormularioGoalCreation extends StatefulWidget {
  TextEditingController nombreController;
  TextEditingController totalController;
  TextEditingController inversionInicialController;
  GlobalKey<FormState> formKey;

  FormularioGoalCreation(
    {this.nombreController,
     this.totalController,
     this.inversionInicialController,
     this.formKey});

  @override
  _FormularioGoalCreationState createState() => _FormularioGoalCreationState();
}

class _FormularioGoalCreationState extends State<FormularioGoalCreation> {

  DateTime _dateTime;

  String getDateText(){
    if(_dateTime == null){
      return 'Fecha en que quieres lograr tu meta';
    }else{
      return '${_dateTime.month}/${_dateTime.day}/${_dateTime.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(40)),
          const Text(
            'Registro de una nueva Meta',
            style: TextStyle(
              fontSize: 21
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50)),
            child: DefaultInput(
              controller: widget.nombreController,
              isContrasena: false,
              validacion: Validadores.validarNombreLargo,
              label: "Nombre de la meta",
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50)),
            child: DefaultInput(
              controller: widget.totalController,
              isContrasena: false,
              validacion: Validadores.validarValorMonetario,
              label: "Cuánto es el monto total para la meta?",
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50)),
            child: OutlinedButton.icon(
              icon: const IconTheme(
                data: IconThemeData(color: Colors.black45),
                child: Icon(Icons.date_range),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: Size.fromHeight(getProportionateScreenHeight(50)),
                side: const BorderSide(
                  color: Colors.black45,
                ),
              ),
              onPressed: () => pickDate(context),
              label: Text(
                getDateText(),
                style: const TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50)),
            child: DefaultInput(
              controller: widget.inversionInicialController,
              isContrasena: false,
              validacion: Validadores.validarValorMonetario,
              label: "Inversión inicial a revisar",
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(30)),
            child: DefaultButton(
              func: () => {
                  if(Validadores.validarNombreLargo(widget.nombreController.text)==null && Validadores.validarValorMonetario(widget.totalController.text)==null 
                  && _dateTime!=null && Validadores.validarValorMonetario(widget.inversionInicialController.text)==null )
                    print('${widget.nombreController.text} ${widget.totalController.text} ${_dateTime.month}/${_dateTime.day}/${_dateTime.year} ${widget.inversionInicialController.text}')
                },
              label: "Registrar",
              colorFondo: kPrimaryColor,
              colorTexto: kSecondaryColor,
            ),
          ),
        ],
      )
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if(newDate==null) return;
    setState(() => _dateTime = newDate);
  }
}