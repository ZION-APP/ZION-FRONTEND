import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zionapp/components/show_error.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/routes/router.gr.dart';

class FondoForm {
  final form = FormGroup({
    'fund_id': FormControl<int>(
      validators: [Validators.required],
    ),
    'goal_id': FormControl<int>(
      validators: [Validators.required],
    ),
    'bank_account_id': FormControl<int>(
      validators: [Validators.required],
    ),
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'init_amount':
        FormControl<double>(validators: [Validators.required], value: 0),
    'target_amount':
        FormControl<double>(validators: [Validators.required], value: 0),
    'target_date': FormControl<String>(validators: [Validators.required]),
  });

  Future<List<DropdownMenuItem>> getTipoFondos(BuildContext context) async {
    final List<DropdownMenuItem> fondos = [];
    try {
      final response = await dioClient.get("$kapiUrl/funds/catalogue");

      for (final item in response.data) {
        fondos.add(DropdownMenuItem(
          value: item["value"] as int,
          child: Text(item["label"] as String),
        ));
      }
    } catch (e) {
      showError("Error al obtener fondos", context);
    }
    return fondos;
  }

  Future<List<DropdownMenuItem>> getMetas(BuildContext context) async {
    final List<DropdownMenuItem> metas = [];
    try {
      final response = await dioClient.get("$kapiUrl/goals/me");

      for (final item in response.data) {
        metas.add(DropdownMenuItem(
          value: item["id"] as int,
          child: Text(item["name"] as String),
        ));
      }
    } catch (e) {
      showError("Error al obtener fondos", context);
    }
    return metas;
  }

  Future<List<DropdownMenuItem>> getCuentasBancarias(
      BuildContext context) async {
    final List<DropdownMenuItem> cuentas = [];
    try {
      final response = await dioClient.get("$kapiUrl/bank_accounts/me");

      for (final item in response.data) {
        final String numeroCuenta = item["number_account"] as String;
        cuentas.add(DropdownMenuItem(
          value: item["id"] as int,
          child: Text(
            "${(item["financial_entity"]["description"] as String).split(" ")[1] ?? ""} ${item["bank_account_type"]["description"] ?? ""} # ${numeroCuenta.substring(numeroCuenta.length - 3, numeroCuenta.length)}",
            overflow: TextOverflow.ellipsis,
          ),
        ));
      }
    } catch (e) {
      showError("Error al obtener cuentas", context);
    }
    return cuentas;
  }

  Future<void> getPerfil(BuildContext context, String tipoFondo) async {
    try {
      final response = await dioClient.get("$kapiUrl/users/me");
      if (!(response.data["is_form_complete"] as bool)) {
        await AutoRouter.of(context).replace(
          FormularioRoute(
              tipoPersona: response.data["kind_of_person_id"] as int ?? 1,
              tipoFondo: tipoFondo),
        );
      }
    } on DioError catch (_) {
      showError("Error del servidor", context);
      await AutoRouter.of(context).pop();
    }
  }

  Future<void> submit(BuildContext context) async {
    try {
      final data = form.value;
      await dioClient.post("$kapiUrl/investment_funds/me/", data: data);
      const sn = SnackBar(
        content: Text("Fondo creado exitosamente"),
        backgroundColor: Colors.greenAccent,
        duration: kAnimationDuration,
      );

      AutoRouter.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        sn,
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        showError("Ingrese los campos correctamente", context);
      } else {
        showError("Error del servidor", context);
      }
    } catch (e) {
      showError("Error", context);
    }
  }
}
