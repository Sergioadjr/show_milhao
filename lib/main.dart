import 'package:flutter/material.dart';
import 'components/questionario.dart';
import 'components/resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

// List<Map<String, Object>> _perguntas
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 1},
        {'texto': 'Preto', 'pontuacao': 0},
        {'texto': 'Amarelo', 'pontuacao': 0},
        {'texto': 'Roxo', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é o seu animal  favorito?',
      'respostas': [
        {'texto': 'Macaco', 'pontuacao': 1},
        {'texto': 'Baleia', 'pontuacao': 0},
        {'texto': 'Elefante', 'pontuacao': 0},
        {'texto': 'Avestruz', 'pontuacao': 0},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Show Do Milhão')),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
