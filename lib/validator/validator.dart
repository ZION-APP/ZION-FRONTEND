class Validadores {
  static String validarCorreo(String correo) {
    return (RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(correo)) ? null : "Por favor ingrese un correo válido";
  }

  static String validarContrasena(String contrasena) {
    if(contrasena.length<8){
      return "La contraseña debe tener mínimo 8 caracteres";
    }else if(!(RegExp(r'[A-Z]').hasMatch(contrasena))){
      return "La contraseña debe incluir por lo menos 1 Mayúscula";
    }else if(!(RegExp(r'[a-z]').hasMatch(contrasena))){
      return "La contraseña debe incluir por lo menos 1 Minúscula";
    }else if(!(RegExp(r'[0-9]').hasMatch(contrasena))){
      return "La contraseña debe incluir por lo menos 1 número";
    }
  }

  static String validarUsername(String username) {
    return ((5<username.length)&&(username.length<20))
        ? null
        : "Por favor ingrese un nombre de usuario válido";
  }
  
  static String validarCedula(String cedula) {
    return (((cedula.length == 10) || (cedula.length == 13)) && (RegExp(r'^[0-9]+$').hasMatch(cedula)))
        ? null
        : "Por favor ingrese cédula/RUC válida/o";
  }
}
