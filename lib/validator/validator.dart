class Validadores {
  static String validarCorreo(String correo) {
    return (correo.contains('@')) ? null : "Porfavor ingrese un correo valido";
  }

  static String validarContrasena(String contrasena) {
    return (contrasena.length > 0)
        ? null
        : "Porfavor ingrese una contrasena valido";
  }
}
