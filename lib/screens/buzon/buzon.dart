import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionApp/bloc/buzon/buzonBloc.dart';
import 'package:zionApp/bloc/buzon/buzonEvent.dart';
import 'package:zionApp/bloc/buzon/buzonState.dart';
import 'package:zionApp/components/cargando.dart';
import 'package:zionApp/screens/buzon/completed/buzonList.dart';

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
          return Text("Error al obtener buzon");
        }
      },
    );
  }
}
