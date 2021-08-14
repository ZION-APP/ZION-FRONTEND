import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';

class Reglamento extends StatefulWidget {
  const Reglamento({Key key}) : super(key: key);

  @override
  _ReglamentoState createState() => _ReglamentoState();
}

class _ReglamentoState extends State<Reglamento> {
  bool _isLoading = true;
  PDFDocument doc;

  @override
  void initState() {
    super.initState();
    _openDoc();
  }

  Future<void> _openDoc() async {
    doc = await PDFDocument.fromURL(
        'https://www.consejodiscapacidades.gob.ec/wp-content/uploads/downloads/2015/04/reglamento-LOTAIP.pdf');
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reglamento'),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : PDFViewer(document: doc)),
    );
  }
}