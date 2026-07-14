import 'dart:convert';
import 'aluno.dart';
import 'nota.dart';

// A Turma é a dona das operações.
// A lista de alunos é privada (o _ na frente do nome faz isso em Dart).
// Ninguém de fora mexe direto na lista: só através dos métodos daqui.
class Turma {
  final List<Aluno> _alunos = [];

  int get totalAlunos => _alunos.length;

  void cadastrarAluno(String nome) {
    _alunos.add(Aluno(nome));
  }

  void lancarNota(int indice, Nota nota) {
    if (indice < 0 || indice >= _alunos.length) {
      print('Aluno não encontrado.');
      return;
    }
    _alunos[indice].notas.add(nota);
  }

  void listar() {
    if (_alunos.isEmpty) {
      print('Nenhum aluno cadastrado ainda.');
      return;
    }

    for (var i = 0; i < _alunos.length; i++) {
      var aluno = _alunos[i];
      print('$i - ${aluno.nome} | Média: ${aluno.media.toStringAsFixed(1)}');

      for (var nota in aluno.notas) {
        print('     ${nota.tipo}: ${nota.valor} (peso ${nota.peso})');
      }
    }
  }

  // Junta os dados de todos os alunos e transforma em texto JSON.
  String exportarJson() {
    var lista = _alunos.map((aluno) => aluno.toMap()).toList();
    return jsonEncode(lista);
  }
}
