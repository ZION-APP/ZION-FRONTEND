import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionapp/bloc/buzon/buzon_bloc.dart';
import 'package:zionapp/bloc/buzon/buzon_event.dart';
import 'package:zionapp/bloc/buzon/buzon_state.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/screens/buzon/completed/buzon_list.dart';

class BuzonHome extends StatefulWidget {
  const BuzonHome({Key key}) : super(key: key);

  @override
  _BuzonHomeState createState() => _BuzonHomeState();
}

class _BuzonHomeState extends State<BuzonHome> {
  @override
  void initState() {
    BlocProvider.of<BuzonBloc>(context).add(GetBuzon(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuzonBloc, BuzonState>(
      builder: (context, state) {
        if (state is BuzonLoading) {
          return Cargando();
        } else if (state is BuzonCompleted) {
          return BuzonList(noticias: state.noticias);
        } else {
          return const Text("Error al obtener buzon");
        }
      },
    );
  }
}
