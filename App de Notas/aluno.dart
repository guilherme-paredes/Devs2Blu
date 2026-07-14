import 'nota.dart';

class Aluno {
   
  String nome;
  List<Nota> notas = [];

  Aluno(this.nome);


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

  factory Aluno.fromMap(Map<String, dynamic> map){
    return Aluno(map['nome']);
  }


}
