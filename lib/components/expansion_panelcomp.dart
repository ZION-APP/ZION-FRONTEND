import 'package:flutter/material.dart';
import 'package:zionApp/sizeConfig.dart';

class ExpandingItems extends StatefulWidget {
  @override
  _ExpandingItemsState createState() => _ExpandingItemsState();
}

class _ExpandingItemsState extends State<ExpandingItems> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) => setState(() {
            _isExpanded = !isExpanded;
          }),
          children: [
            ExpansionPanel(
              body: ListTile(
                  subtitle: Text(
                "Un fondo de inversión es un instrumento de ahorro que reúne a un gran número de personas que quieren invertir su dinero.El fondo pone en común el dinero de este grupo de personas y una entidad gestora (la Administradora de Fondos) se ocupa de invertirlo en una serie de activos como pueden ser acciones, títulos de renta fija, y demás títulos valores (incluso en otros fondos de Inversión).",
                textAlign: TextAlign.justify,
              )),
              headerBuilder: (_, isExpanded) {
                return Center(
                  child: Text("  ¿Qué es un fondo de inversión administrado?"),
                );
              },
              isExpanded: _isExpanded,
            ),
          ],
        ),
      ),
    );
  }
}
