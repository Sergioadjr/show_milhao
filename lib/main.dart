import 'package:flutter/material.dart';
import 'components/questionario.dart';
import 'components/resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

// List<Map<String, Object>> _perguntas
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Azul', 'Preto', 'Amarelo', 'Roxo'],
    },
    {
      'texto': 'Qual é o seu animal  favorito?',
      'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
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
        body: temPerguntaSelecionada ? Questionario(perguntas: _perguntas, perguntaSelecionada: _perguntaSelecionada, quandoResponder: _responder,) : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
