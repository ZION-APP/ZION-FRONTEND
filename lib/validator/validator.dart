import 'package:zionapp/models/tipo_banco.dart';

class Validadores {
  static String validarCorreo(String correo) {
    return (RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(correo))
        ? null
        : "Por favor ingrese un correo válido";
  }

  static String validarContrasena(String contrasena) {
    if (contrasena.length < 8) {
      return "La contraseña debe tener mínimo 8 caracteres";
      // ignore: unnecessary_raw_strings
    } else if (!RegExp(r'[A-Z]').hasMatch(contrasena)) {
      return "La contraseña debe incluir por lo menos 1 Mayúscula";
      // ignore: unnecessary_raw_strings
    } else if (!RegExp(r'[a-z]').hasMatch(contrasena)) {
      return "La contraseña debe incluir por lo menos 1 Minúscula";
      // ignore: unnecessary_raw_strings
    } else if (!RegExp(r'[0-9]').hasMatch(contrasena)) {
      return "La contraseña debe incluir por lo menos 1 número";
    } else {
      return null;
    }
  }

  static String validarUsername(String username) {
    return ((5 < username.length) && (username.length < 20))
        ? null
        : "Por favor ingrese un nombre de usuario válido";
  }

  static String validarNombreLargo(String name) {
    return ((5 < name.length) && (name.length < 30))
        ? null
        : "Por favor ingrese un nombre válido";
  }

  static String validarValorMonetario(String value) {
    return (RegExp(r'^[0-9]*\.[0-9]{2}$').hasMatch(value))
        ? null
        : "Por favor ingrese un número como 100000.00";
  }

  static String validarCedula(String cedula) {
    return (((cedula.length == 10) || (cedula.length == 13)) &&
            (RegExp(r'^[0-9]+$').hasMatch(cedula)))
        ? null
        : "Por favor ingrese cédula/RUC válida/o";
  }

  static String validarNumCuenta(String value, TipoBanco banco) {
    if (banco == null) {
      return 'Por favor escoger un banco';
    } else if (RegExp(r'^[0-9]+$').hasMatch(value)) {
      if ((banco == TipoBanco.BancoGuayaquil ||
              banco == TipoBanco.BancoPacifico) &&
          value.length == 10) {
        return null;
      } else if (banco == TipoBanco.BancoProdubanco && value.length == 11) {
        return null;
      }
    }
    return 'Por favor ingresar un número válido';
  }
}
