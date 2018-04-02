
class Validations{
  String validateName(String value) {
    if (value.isEmpty) return 'Nombre es un campo requerido.';
    final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Porfavor ingrese sólo caracteres alfanuméricos.';
    return null;
  }

    String validateEmail(String value) {
    if (value.isEmpty) return 'Correo es un campo requerido.';
    final RegExp nameExp = new RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
    if (!nameExp.hasMatch(value)) return 'Correo electrónico inválido';
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) return 'Porfavor, escoja unacontraseña.';
    return null;
  }

}