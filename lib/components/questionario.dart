import 'package:flutter/material.dart';
import 'package:show_milhao/components/questao.dart';
import 'package:show_milhao/components/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            () => quandoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _mostrarAjuda(context),
          child: Text('Ajuda'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.yellow[700],
          ),
        ),
      ],
    );
  }

  void _mostrarAjuda(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajuda'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _usarAjuda('Pular');
                },
                child: Text('Pular'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _usarAjuda('Ajuda dos universitários');
                },
                child: Text('Ajuda dos universitários'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _usarAjuda('Ajuda das cartas');
                },
                child: Text('Ajuda das cartas'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _usarAjuda(String tipoAjuda) {
    // Implemente a lógica para cada tipo de ajuda aqui
    if (tipoAjuda == 'Pular') {
      // Implemente a lógica para pular a pergunta
    } else if (tipoAjuda == 'Ajuda dos universitários') {
      // Implemente a lógica para a ajuda dos universitários
    } else if (tipoAjuda == 'Ajuda das cartas') {
      // Implemente a lógica para a ajuda das cartas
    }
  }
}
