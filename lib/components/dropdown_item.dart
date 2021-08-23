// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

class ExpandingItems extends StatefulWidget {
  final String contenido;
  final String titulo;

  const ExpandingItems({
    this.titulo,
    this.contenido,
  });

  @override
  _ExpandingItemsState createState() => _ExpandingItemsState(titulo, contenido);
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
        margin: const EdgeInsets.symmetric(vertical: 10),
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
                  child: Text(
                    titulo,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
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