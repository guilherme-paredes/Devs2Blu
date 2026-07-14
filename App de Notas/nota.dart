// Classe abstrata: define o que toda nota tem em comum.
// Não pode ser criada diretamente (não dá pra fazer Nota(...)).
abstract class Nota {
  double valor;
  String descricao;

  Nota(this.valor, this.descricao);

  // Cada tipo de nota (Prova, Trabalho...) responde essas duas
  // perguntas do seu próprio jeito.
  double get peso;
  String get tipo;

  // Transforma a nota em um Map simples, pronto para virar JSON.
  Map<String, dynamic> toMap() {
    return {
      'valor': valor,
      'descricao': descricao,
      'tipo': tipo,
      'peso': peso,
    };
  }
}

// Nota de prova: peso 2 na média.
class NotaProva extends Nota {
  NotaProva(double valor, String descricao) : super(valor, descricao);

  @override
  double get peso => 2;

  @override
  String get tipo => 'Prova';
}

// Nota de trabalho: peso 1 na média.
class NotaTrabalho extends Nota {
  NotaTrabalho(double valor, String descricao) : super(valor, descricao);

  @override
  double get peso => 1;

  @override
  String get tipo => 'Trabalho';
}
