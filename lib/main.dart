import 'package:flutter/material.dart';
import 'components/questao.dart';
import 'components/resposta.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Azul', 'Preto', 'Amarelo', 'Roxo'],
      },
      {
        'texto': 'Qual é o seu animal  favorito?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
      {
        'texto': 'Fazer?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
      {
        'texto': 'Fazer?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
      {
        'texto': 'Fazer?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
      {
        'texto': 'Fazer?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
      {
        'texto': 'Fazer?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
      {
        'texto': 'Fazer?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
      {
        'texto': 'Fazer?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
      {
        'texto': 'Fazer?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
      {
        'texto': 'Fazer?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
      {
        'texto': 'Fazer?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
      {
        'texto': 'Fazer?',
        'respostas': ['Macaco', 'Baleia', 'Elefante', 'Avestruz'],
      },
    ];

    List<Widget> respostas = [];

    for (String textoResp
        in perguntas[_perguntaSelecionada].cast()['respostas']) {
      respostas.add(Resposta(textoResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Show Do Milhão')),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas,
          ],
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
