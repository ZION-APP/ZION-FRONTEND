import 'package:flutter_test/flutter_test.dart';
import 'package:zionApp/validator/validator.dart';

void main() {
  //Pruebas para validarCorreo()
  test('Dado un correo vacío, validarCorreo no retorna null', () {
    String result;
    result = Validadores.validarCorreo('');
    expect(result, 'Por favor ingrese un correo válido');
  });

  test('Dado un correo sin @, validarCorreo no retorna null', () {
    String result;
    result = Validadores.validarCorreo('asadaead.com');
    expect(result, 'Por favor ingrese un correo válido');
  });

  test('Dado un correo sin ., validarCorreo no retorna null', () {
    String result;
    result = Validadores.validarCorreo('dhahduw@ndaknd');
    expect(result, 'Por favor ingrese un correo válido');
  });

  test('Dado un correo sin @ ni ., validarCorreo no retorna null', () {
    String result;
    result = Validadores.validarCorreo('asdadwadsdkmkon');
    expect(result, 'Por favor ingrese un correo válido');
  });

  test('Dado un correo con por lo menos un @ y un ., validarCorreo retorna null', () {
    String result;
    result = Validadores.validarCorreo('kbaksjd@skda.cdas.ds');
    expect(result, null);
  });


  //pruebas para validarContrasena()
  test('Dada una contraseña vacía, validarContrasena no retorna null', () {
    String result;
    result = Validadores.validarContrasena('');
    expect(result, 'La contraseña debe tener mínimo 8 caracteres');
  });

  test('Dada una contraseña con menos de 8 caracteres, validarContrasena no retorna null', () {
    String result;
    result = Validadores.validarContrasena('Ajd?4sF');
    expect(result, 'La contraseña debe tener mínimo 8 caracteres');
  });

  test('Dada una contraseña sin por lo menos una mayúscula, validarContrasena no retorna null', () {
    String result;
    result = Validadores.validarContrasena('ajd?4sd32');
    expect(result, 'La contraseña debe incluir por lo menos 1 Mayúscula');
  });

  test('Dada una contraseña sin por lo menos una minúscula, validarContrasena no retorna null', () {
    String result;
    result = Validadores.validarContrasena('AJD?4SD32');
    expect(result, 'La contraseña debe incluir por lo menos 1 Minúscula');
  });

  test('Dada una contraseña sin por lo menos un número, validarContrasena no retorna null', () {
    String result;
    result = Validadores.validarContrasena('ajd?bsdFT');
    expect(result, 'La contraseña debe incluir por lo menos 1 número');
  });

  test('Dada una contraseña válida, validarContrasena retorna null', () {
    String result;
    result = Validadores.validarContrasena('ajd?34bsdFT');
    expect(result, null);
  });


  //pruebas para validarUsername()
  test('Dado un nombre vacío, validarUsuario no retorna null', () {
    String result;
    result = Validadores.validarUsername('');
    expect(result, 'Por favor ingrese un nombre de usuario válido');
  });

  test('Dado un nombre de usuario con menos de 5 caracteres, validarUsuario no retorna null', () {
    String result;
    result = Validadores.validarUsername('xEcd');
    expect(result, 'Por favor ingrese un nombre de usuario válido');
  });

  test('Dado un nombre de usuario con más de 20 caracteres, validarUsuario no retorna null', () {
    String result;
    result = Validadores.validarUsername('xEcddjanfoJHJISHjahsdjak3_ksd');
    expect(result, 'Por favor ingrese un nombre de usuario válido');
  });

  test('Dado un nombre de usuario válido, validarUsuario retorna null', () {
    String result;
    result = Validadores.validarUsername('xEcdsdSds9');
    expect(result, null);
  });


  //pruebas para validarNombreLargo()
  test('Dado un nombre vacío, validarNombreLargo no retorna null', () {
    String result;
    result = Validadores.validarNombreLargo('');
    expect(result, 'Por favor ingrese un nombre válido');
  });

  test('Dado un nombre con menos de 5 caracteres, validarUsuario no retorna null', () {
    String result;
    result = Validadores.validarNombreLargo('xEcd');
    expect(result, 'Por favor ingrese un nombre válido');
  });

  test('Dado un nombre con más de 30 caracteres, validarUsuario no retorna null', () {
    String result;
    result = Validadores.validarNombreLargo('xEcddjanfoJHJISHjahsdjak3_ksdJJI878__90=kjo');
    expect(result, 'Por favor ingrese un nombre válido');
  });

  test('Dado un nombre válido, validarUsuario retorna null', () {
    String result;
    result = Validadores.validarNombreLargo('xEcdsdSds9');
    expect(result, null);
  });


  //pruebas para validarValorMonetario()
  test('Dado un valor vacío, validarValorMonetario no retorna null', () {
    String result;
    result = Validadores.validarValorMonetario('');
    expect(result, 'Por favor ingrese un número como 100000.00');
  });

  test('Dado un valor que no solo tiene números y dos decimales, validarValorMonetario no retorna null', () {
    String result;
    result = Validadores.validarValorMonetario('A#dd231.3221dq');
    expect(result, 'Por favor ingrese un número como 100000.00');
  });

  test('Dado un valor que tiene un solo decimal, validarValorMonetario no retorna null', () {
    String result;
    result = Validadores.validarValorMonetario('234123.2');
    expect(result, 'Por favor ingrese un número como 100000.00');
  });

  test('Dado un valor que tiene más de dos decimales, validarValorMonetario no retorna null', () {
    String result;
    result = Validadores.validarValorMonetario('23731998.8223');
    expect(result, 'Por favor ingrese un número como 100000.00');
  });

  test('Dado un valor que tiene dos decimales, validarValorMonetario retorna null', () {
    String result;
    result = Validadores.validarValorMonetario('23731998.82');
    expect(result, null);
  });

  //pruebas para validarCedula()
  test('Dado un valor vacío, validarCedula no retorna null', () {
    String result;
    result = Validadores.validarCedula('');
    expect(result, 'Por favor ingrese cédula/RUC válida/o');
  });

  test('Dado un valor con caracteres que no sean dígitos, validarCedula no retorna null', () {
    String result;
    result = Validadores.validarCedula('3398jaiK*&)');
    expect(result, 'Por favor ingrese cédula/RUC válida/o');
  });

  test('Dado un valor con menos de 10 dígitos, validarCedula no retorna null', () {
    String result;
    result = Validadores.validarCedula('9203192');
    expect(result, 'Por favor ingrese cédula/RUC válida/o');
  });

  test('Dado un valor con entre 10 y 13 dígitos, validarCedula no retorna null', () {
    String result;
    result = Validadores.validarCedula('37465839023');
    expect(result, 'Por favor ingrese cédula/RUC válida/o');
  });

  test('Dado un valor con más de 13 dígitos, validarCedula no retorna null', () {
    String result;
    result = Validadores.validarCedula('8748927893647826784342');
    expect(result, 'Por favor ingrese cédula/RUC válida/o');
  });

  test('Dado un valor con 10 dígitos, validarCedula retorna null', () {
    String result;
    result = Validadores.validarCedula('0934854224');
    expect(result, null);
  });

  test('Dado un valor con 13 dígitos, validarCedula retorna null', () {
    String result;
    result = Validadores.validarCedula('0934854224034');
    expect(result, null);
  });
}