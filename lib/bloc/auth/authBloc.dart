import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionApp/Constants.dart';
import 'package:zionApp/bloc/auth/authEvent.dart';
import 'package:zionApp/bloc/auth/authState.dart';
import 'package:zionApp/routes/router.gr.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc(LoginInitial inicial) : super(inicial);

  // Under the hood, the Bloc library works with regular Dart Streams.
  // The "async*" makes this method an async generator, which outputs a Stream
  @override
  Stream<LogInState> mapEventToState(
    LogInEvent event,
  ) async* {
    if (event is IniciarSesion) {
      // Outputting a state from the asynchronous generator
      yield LoginLoading();
      try {
        Map<String, String> body = {
          'usuario': event.usuario,
          'contrasena': event.contrasena
        };
        Response response = await Dio()
            .post("https://api.practical.com.ec/auth/residente", data: body);
        await storage.write(
            key: "user", value: json.encode(response.data["respuesta"]));
        await storage.write(
            key: "token", value: response.data["respuesta"]["token"] as String);
        if (event.recuerdame) {
          await storage.write(key: "usuario", value: event.usuario);
          await storage.write(key: "contrasena", value: event.contrasena);
          await storage.write(key: "recuerdame", value: "true");
        } else {
          await storage.delete(key: "usuario");
          await storage.delete(key: "contrasena");
          await storage.delete(key: "recuerdame");
        }
        yield LogInCompleted("H");
      } on DioError catch (e) {
        yield LoginFailed(e.response.data["respuesta"] as String);
      }
    }
    if (event is CerrarSesion) {
      AutoRouter.of(event.context).replaceAll([LoginRoute()]);
      yield LoginInitial();
    }
  }

  static void verificarToken(int statusCode, BuildContext context) {
    if (statusCode == 401) {
      AutoRouter.of(context).replaceAll([LoginRoute()]);
    }
  }
}
