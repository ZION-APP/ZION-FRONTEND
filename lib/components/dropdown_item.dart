import 'package:flutter/material.dart';

class ExpandingItems extends StatefulWidget {
  final String contenido;
  final String titulo;

  ExpandingItems({
    this.titulo,
    this.contenido,
  });

  _ExpandingItemsState createState() =>
      _ExpandingItemsState(this.titulo, this.contenido);
}

class _ExpandingItemsState extends State<ExpandingItems> {
  bool _isExpanded = false;
  final String contenido;
  final String titulo;
  _ExpandingItemsState(
    this.titulo,
    this.contenido,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) => setState(() {
            _isExpanded = !isExpanded;
          }),
          children: [
            ExpansionPanel(
              body: ListTile(
                  subtitle: Text(
                contenido,
                textAlign: TextAlign.justify,
              )),
              headerBuilder: (_, isExpanded) {
                return Center(
                  child: Text(titulo),
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
