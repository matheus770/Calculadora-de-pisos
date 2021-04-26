class ValidatorHelper {
  static String isNotEmptyValue(String text) {
    return text.isEmpty ? "Campo Obrigatorio" : null;
  }

  static String isNotNegativeValue(String text) {
    var c = double.parse(text);
    if (c <= 0) {
      return ("Erro");
    } else {}
    return null;
  }

  static String isNotEmptyAndNegative(String text) {
    if (text.isEmpty) {
      return "Campo Obrigatorio";
    } else {
      var c = double.parse(text);
      if (c <= 0) {
        return "Erro, Numero < or = 0";
      }
    }
    return null;
  }
}
