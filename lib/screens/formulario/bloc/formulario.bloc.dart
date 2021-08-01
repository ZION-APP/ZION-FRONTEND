import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/routes/router.gr.dart';
import 'package:zionapp/screens/formulario/bloc/formulario.event.dart';
import 'package:zionapp/screens/formulario/bloc/formulario.state.dart';

class FormularioBloc extends Bloc<FormularioEvent, FormularioState> {
  Map formulario={
    "":"saas"
  };
  FormularioBloc(FormularioInitial inicial) : super(inicial);


  
  @override
  Stream<FormularioState> mapEventToState(
    FormularioEvent event,
  ) async* {
    if (event is ContinueFormulario) {
      yield FormularioLoading();
      try {} on DioError catch (e) {
        yield FormularioFailed(e.response.data["error"] as String);
      }
    }
    if (event is CloseFormulario) {}
  }

  static void verificarToken(int statusCode, BuildContext context) {
    if (statusCode == 401) {
      AutoRouter.of(context).replaceAll([const LoginRoute()]);
    }
  }
}
