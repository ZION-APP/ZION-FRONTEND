import 'package:flutter_test/flutter_test.dart';
import 'package:zionapp/models/tipo_banco.dart';
import 'package:zionapp/validator/validator.dart';

void main() {
  //Pruebas para validarCorreo()
  test('validarCorreo1', () {
    String result;
    result = Validadores.validarCorreo('');
    expect(result, 'Por favor ingrese un correo válido');
  });

  test('validarCorreo2', () {
    String result;
    result = Validadores.validarCorreo('asadaead.com');
    expect(result, 'Por favor ingrese un correo válido');
  });

  test('validarCorreo3', () {
    String result;
    result = Validadores.validarCorreo('dhahduw@ndaknd');
    expect(result, 'Por favor ingrese un correo válido');
  });

  test('validarCorreo4', () {
    String result;
    result = Validadores.validarCorreo('asdadwadsdkmkon');
    expect(result, 'Por favor ingrese un correo válido');
  });

  test('validarCorreo5', () {
    String result;
    result = Validadores.validarCorreo('kbaksjd@skda.cdas.ds');
    expect(result, null);
  });

  //pruebas para validarContrasena()
  test('validarContrasena1', () {
    String result;
    result = Validadores.validarContrasena('');
    expect(result, 'La contraseña debe tener mínimo 8 caracteres');
  });

  test('validarContrasena2', () {
    String result;
    result = Validadores.validarContrasena('Ajd?4sF');
    expect(result, 'La contraseña debe tener mínimo 8 caracteres');
  });

  test('validarContrasena3', () {
    String result;
    result = Validadores.validarContrasena('ajd?4sd32');
    expect(result, 'La contraseña debe incluir por lo menos 1 Mayúscula');
  });

  test('validarContrasena4', () {
    String result;
    result = Validadores.validarContrasena('AJD?4SD32');
    expect(result, 'La contraseña debe incluir por lo menos 1 Minúscula');
  });

  test('validarContrasena5', () {
    String result;
    result = Validadores.validarContrasena('ajd?bsdFT');
    expect(result, 'La contraseña debe incluir por lo menos 1 número');
  });

  test('validarContrasena6', () {
    String result;
    result = Validadores.validarContrasena('ajd?34bsdFT');
    expect(result, null);
  });

  //pruebas para validarUsername()
  test('validarUsername1', () {
    String result;
    result = Validadores.validarUsername('');
    expect(result, 'Por favor ingrese un nombre de usuario válido');
  });

  test('validarUsername2', () {
    String result;
    result = Validadores.validarUsername('xEcd');
    expect(result, 'Por favor ingrese un nombre de usuario válido');
  });

  test('validarUsername3', () {
    String result;
    result = Validadores.validarUsername('xEcddjanfoJHJISHjahsdjak3_ksd');
    expect(result, 'Por favor ingrese un nombre de usuario válido');
  });

  test('validarUsername4', () {
    String result;
    result = Validadores.validarUsername('xEcdsdSds9');
    expect(result, null);
  });

  //pruebas para validarNombreLargo()
  test('validarNombreLargo1', () {
    String result;
    result = Validadores.validarNombreLargo('');
    expect(result, 'Por favor ingrese un nombre válido');
  });

  test('validarNombreLargo2', () {
    String result;
    result = Validadores.validarNombreLargo('xEcd');
    expect(result, 'Por favor ingrese un nombre válido');
  });

  test('validarNombreLargo3', () {
    String result;
    result = Validadores.validarNombreLargo(
        'xEcddjanfoJHJISHjahsdjak3_ksdJJI878__90=kjo');
    expect(result, 'Por favor ingrese un nombre válido');
  });

  test('validarNombreLargo4', () {
    String result;
    result = Validadores.validarNombreLargo('xEcdsdSds9');
    expect(result, null);
  });

  //pruebas para validarValorMonetario()
  test('validarValorMonetario1', () {
    String result;
    result = Validadores.validarValorMonetario('');
    expect(result, 'Por favor ingrese un número como 100000.00');
  });

  test('validarValorMonetario2', () {
    String result;
    result = Validadores.validarValorMonetario('A#dd231.3221dq');
    expect(result, 'Por favor ingrese un número como 100000.00');
  });

  test('validarValorMonetario3', () {
    String result;
    result = Validadores.validarValorMonetario('234123.2');
    expect(result, 'Por favor ingrese un número como 100000.00');
  });

  test('validarValorMonetario4', () {
    String result;
    result = Validadores.validarValorMonetario('23731998.8223');
    expect(result, 'Por favor ingrese un número como 100000.00');
  });

  test('validarValorMonetario5', () {
    String result;
    result = Validadores.validarValorMonetario('237398.82');
    expect(result, null);
  });

  //pruebas para validarCedula()
  test(' validarCedula1', () {
    String result;
    result = Validadores.validarCedula('');
    expect(result, 'Por favor ingrese cédula/RUC válida/o');
  });

  test(' validarCedula2', () {
    String result;
    result = Validadores.validarCedula('3398jaiK*&)');
    expect(result, 'Por favor ingrese cédula/RUC válida/o');
  });

  test(' validarCedula3', () {
    String result;
    result = Validadores.validarCedula('9203192');
    expect(result, 'Por favor ingrese cédula/RUC válida/o');
  });

  test(' validarCedula4', () {
    String result;
    result = Validadores.validarCedula('37465839023');
    expect(result, 'Por favor ingrese cédula/RUC válida/o');
  });

  test(' validarCedula5', () {
    String result;
    result = Validadores.validarCedula('8748927893647826784342');
    expect(result, 'Por favor ingrese cédula/RUC válida/o');
  });

  test(' validarCedula6', () {
    String result;
    result = Validadores.validarCedula('0934854224');
    expect(result, null);
  });

  test(' validarCedula7', () {
    String result;
    result = Validadores.validarCedula('0934854224034');
    expect(result, null);
  });

  //pruebas para validarNumCuenta
  test('validarNumCuenta1', () {
    String result;
    result = Validadores.validarNumCuenta('0231231232', null);
    expect(result, 'Por favor escoger un banco');
  });

  test('validarNumCuenta2', () {
    String result;
    result = Validadores.validarNumCuenta('12.31a#42', null);
    expect(result, 'Por favor escoger un banco');
  });

  test('validarNumCuenta3', () {
    String result;
    result = Validadores.validarNumCuenta('029482023921', null);
    expect(result, 'Por favor escoger un banco');
  });

  test('validarNumCuenta4', () {
    String result;
    result = Validadores.validarNumCuenta('02312312324', null);
    expect(result, 'Por favor escoger un banco');
  });

  test('validarNumCuenta5', () {
    String result;
    result =
        Validadores.validarNumCuenta('0231231232', TipoBanco.BancoGuayaquil);
    expect(result, null);
  });

  test('validarNumCuenta6', () {
    String result;
    result = Validadores.validarNumCuenta('12.31a#42', TipoBanco.BancoPacifico);
    expect(result, 'Por favor ingresar un número válido');
  });

  test('validarNumCuenta7', () {
    String result;
    result =
        Validadores.validarNumCuenta('029482023921', TipoBanco.BancoGuayaquil);
    expect(result, 'Por favor ingresar un número válido');
  });

  test('validarNumCuenta8', () {
    String result;
    result =
        Validadores.validarNumCuenta('02312312324', TipoBanco.BancoPacifico);
    expect(result, 'Por favor ingresar un número válido');
  });

  test('validarNumCuenta9', () {
    String result;
    result =
        Validadores.validarNumCuenta('0231231232', TipoBanco.BancoProdubanco);
    expect(result, 'Por favor ingresar un número válido');
  });

  test('validarNumCuenta10', () {
    String result;
    result =
        Validadores.validarNumCuenta('12.31a#42', TipoBanco.BancoProdubanco);
    expect(result, 'Por favor ingresar un número válido');
  });

  test('validarNumCuenta11', () {
    String result;
    result =
        Validadores.validarNumCuenta('029482023921', TipoBanco.BancoProdubanco);
    expect(result, 'Por favor ingresar un número válido');
  });

  test('validarNumCuenta12', () {
    String result;
    result =
        Validadores.validarNumCuenta('02312312324', TipoBanco.BancoProdubanco);
    expect(result, null);
  });
}
