import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  
  final int pontuacao;

  Resultado(this.pontuacao);

  String? get fraseDoResultado {
    if (pontuacao <= 1) {
      return "Poxa";
    } else if (pontuacao <= 5) {
      return "Quase";
    } else if (pontuacao <= 10) {
      return "Brabao";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fraseDoResultado.toString(),
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
