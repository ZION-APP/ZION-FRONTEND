import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/dropdown_item.dart';
import 'package:zionapp/components/show_error.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/components/cargando.dart';

class Notificaciones extends StatefulWidget {
  @override
  _NotificacionesState createState() => _NotificacionesState();
}

class _NotificacionesState extends State<Notificaciones> {
  dynamic notificaciones;
  String fecha;
  bool loading = true;

  Future<void> _obtenerUsuario() async {
    try {
      final Response response =
          await dioClient.get('$kapiUrl/notifications/me');
      setState(() {
        notificaciones = response.data;
        loading = false;
      });
    } on DioError catch (e) {
      print(e);
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
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        iconTheme: IconThemeData(
          color: kPrimaryLightColor,
        ),
        // ignore: prefer_const_constructors
        title: Text(
          'Notificaciones ',
          // ignore: prefer_const_constructors
          style: TextStyle(color: kPrimaryLightColor),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
          margin: const EdgeInsets.fromLTRB(25, 20, 25, 20),
          child: !loading
              ? ListView(
                  children: [
                    for (var item in notificaciones)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(item['fecha'].split('T')[0] as String),
                                const SizedBox(width: 20),
                                Text(item['fecha'].split('T')[1].split('.')[0]
                                    as String),
                              ],
                            ),
                            ExpandingItems(
                                titulo: item['tittle'] as String,
                                contenido: item["body"] as String),
                          ],
                        ),
                      ),
                  ],
                )
              : Cargando()),
    );
  }
}
