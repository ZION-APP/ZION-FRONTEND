import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionapp/components/show_error.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/bloc/auth/auth_event.dart';
import 'package:zionapp/bloc/auth/auth_state.dart';
import 'package:zionapp/routes/router.gr.dart';

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
        final String basicAuth =
            // ignore: prefer_interpolation_to_compose_strings
            'Basic ' +
                base64Encode(
                    utf8.encode('${event.usuario}:${event.contrasena}'));

        final Map<String, String> headers = {'Authorization': basicAuth};
        final Map<String, String> body = {'apiKeyToken': apiKeyToken};
        final Response response = await Dio().post("$kapiUrl/auth/sign-in",
            options: Options(headers: headers), data: body);
        await storage.write(
            key: "user", value: json.encode(response.data["user"]));
        await storage.write(
            key: "token", value: response.data["access_token"] as String);
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
        if (e.type == DioErrorType.other) {
          yield LoginFailed("Error del servidor");
        } else {
          yield LoginFailed("Error de usuario y/o contrasena");
        }
      } catch (e) {
        yield LoginFailed("Ingrese los campos");
      }
    }
    if (event is CerrarSesion) {
      AutoRouter.of(event.context).replaceAll([const LoginRoute()]);
      yield LoginInitial();
    }
  }

  static void verificarToken(int statusCode, BuildContext context) {
    if (statusCode == 401) {
      AutoRouter.of(context).replaceAll([const LoginRoute()]);
    }
  }
}
