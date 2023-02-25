import 'package:flutter/cupertino.dart';

class Notas extends ChangeNotifier {
  List<double> _notas = [0, 0, 0, 0];

  double getNota(int index) => _notas[index];

  void setNota(double valor, int index) {
    _notas[index] = valor;
    notifyListeners();
  }

  double getMedia() {
    double soma = 0;
    for (var nota in _notas) {
      soma += nota;
    }
    return soma / 4;
  }
}
