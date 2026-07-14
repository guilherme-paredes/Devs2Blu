import 'nota.dart';

// Um Aluno tem um nome e a sua própria lista de notas.
// (Isso é composição: o Aluno "tem" Notas dentro dele.)
class Aluno {
  String nome;
  List<Nota> notas = [];

  Aluno(this.nome);

  // Média ponderada: soma de (valor * peso) dividido pela soma dos pesos.
  // Repare que não existe nenhum "if" checando o tipo da nota aqui.
  // O n.peso já vem certo sozinho, dependendo se é Prova ou Trabalho.
  double get media {
    if (notas.isEmpty) return 0;

    double soma = 0;
    double somaPesos = 0;

    for (var nota in notas) {
      soma += nota.valor * nota.peso;
      somaPesos += nota.peso;
    }

    return soma / somaPesos;
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'notas': notas.map((nota) => nota.toMap()).toList(),
    };
  }
}
