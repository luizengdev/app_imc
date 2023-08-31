import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class ImcBloc {
  var heightCtrl = MaskedTextController(mask: '000');
  var weightCtrl = MaskedTextController(mask: '000');
  var result = "Preencha os dados para calcular seu IMC!";

  calculate() {
    if (weightCtrl.text.isEmpty || heightCtrl.text.isEmpty) {
      result = "Preencha os dados para calcular seu IMC!";
      return;
    }

    try {
      double weight = double.parse(weightCtrl.text);
      double height = double.parse(heightCtrl.text) / 100;
      double imc = weight / (height * height);

      if (imc < 16) {
        result = "Magreza grave!(${imc.toStringAsPrecision(2)})";
      } else if (imc >= 16.1 && imc <= 17) {
        result = "Magreza moderada! (${imc.toStringAsPrecision(2)})";
      } else if (imc >= 17.9 && imc <= 18.5) {
        result = "Magreza leve! (${imc.toStringAsPrecision(2)})";
      } else if (imc >= 18.6 && imc <= 25.9) {
        result = "Saudável (Peso ideal) (${imc.toStringAsPrecision(2)})";
      } else if (imc >= 26 && imc <= 30) {
        result = "Sobrepeso! (${imc.toStringAsPrecision(2)})";
      } else if (imc >= 30.1 && imc <= 35) {
        result = "Obesidade Grau I (${imc.toStringAsPrecision(2)})";
      } else if (imc >= 35.1 && imc <= 40) {
        result = "Obesidade Grau II (severa) (${imc.toStringAsPrecision(2)})";
      } else if (imc >= 40.1) {
        result =
            "Obesidade Grau III (mórbida) (${imc.toStringAsPrecision(2)})";
      }
    } catch (e) {
      result = "Valores inválidos para altura ou peso!";
    }
  }
}
