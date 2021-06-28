import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionapp/constants.dart';
import 'package:zionapp/bloc/auth/auth_bloc.dart';
import 'package:zionapp/bloc/buzon/buzon_event.dart';
import 'package:zionapp/bloc/buzon/buzon_state.dart';
import 'package:dio/dio.dart';

class BuzonBloc extends Bloc<BuzonEvent, BuzonState> {
  BuzonBloc(BuzonLoading inicial) : super(inicial);

  // Under the hood, the Bloc library works with regular Dart Streams.
  // The "async*" makes this method an async generator, which outputs a Stream
  @override
  Stream<BuzonState> mapEventToState(BuzonEvent event) async* {
    if (event is GetBuzon) {
      // Outputting a state from the asynchronous generator
      final BuildContext context = event.context;
      yield BuzonLoading();
      try {
        final String token = await storage.read(key: "token");
        final Response response = await Dio().get("$kapiUrl/noticias",
            options: Options(headers: {"token": token}));
        yield BuzonCompleted(response.data["respuesta"]);
      } on DioError catch (e) {
        if (e.response == null) {
          yield BuzonFailed("Error de conexion con el servidor");
        }
        LogInBloc.verificarToken(e.response.statusCode, context);
        yield BuzonFailed("Error de api");
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
