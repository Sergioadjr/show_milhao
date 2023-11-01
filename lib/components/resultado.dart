import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseDoResultado.toString(),
            style: TextStyle(fontSize: 32),
          ),
        ),
        TextButton(
          onPressed: reiniciarQuestionario,
          child: Text(
            'Jogar novamente',
            style: TextStyle(fontSize: 24),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red[900],
          ),
        )
      ],
    );
  }
}
