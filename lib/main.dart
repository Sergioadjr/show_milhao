import 'package:flutter/material.dart';
import 'components/questionario.dart';
import 'components/resultado.dart';
import 'components/dbPerguntas.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  var _mostrarResultado = false;

// List<Map<String, Object>> _perguntas
  final _perguntas = PerguntasDB.perguntas;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;

        if (pontuacao == 0) {
          _mostrarResultado = true;
        }
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
      _mostrarResultado = false;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Show do Serjão')),
        ),
        body: _mostrarResultado
            ? Resultado(_pontuacaoTotal, _reiniciarQuestionario)
            : temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder,
                  )
                : Resultado(
                    _pontuacaoTotal,
                    _reiniciarQuestionario,
                  ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
