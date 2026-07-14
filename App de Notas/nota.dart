abstract class Nota {
  double valor;
  String descricao;

  Nota(this.valor, this.descricao);

  double get peso;
  String get tipo;

  Map<String, dynamic> toMap() {
    return {
      'valor': valor,
      'descricao': descricao,
      'tipo': tipo,
      'peso': peso,
    };
  }
}


class NotaProva extends Nota {
  NotaProva(double valor, String descricao) : super(valor, descricao);

  @override
  double get peso => 2;

  @override
  String get tipo => 'Prova';
}


class NotaTrabalho extends Nota {
  NotaTrabalho(double valor, String descricao) : super(valor, descricao);

  @override
  double get peso => 1;

  @override
  String get tipo => 'Trabalho';
}
