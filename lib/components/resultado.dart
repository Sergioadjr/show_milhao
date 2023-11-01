import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String? get fraseDoResultado {
    if (pontuacao <= 5) {
      return "Infelizmente você acertou apenas $pontuacao questão/õe(s)";
    } else if (pontuacao <= 10) {
      return "Está melhorando, você acertou $pontuacao questões";
    } else if (pontuacao <= 15) {
      return "Vamos lá, você consegue, você acertou $pontuacao questões";
    } else if (pontuacao <= 21) {
      return "Muito bom, você acertou $pontuacao questões" ;
    } else if (pontuacao == 22) {
      return "Parabéns, você acertou $pontuacao questões" ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseDoResultado!,
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
