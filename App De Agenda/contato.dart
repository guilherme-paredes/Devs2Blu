abstract class Contato {
  String nome;
  String telefone;
  String email;

  Contato(this.nome, this.telefone, this.email);

  String imprimir() {
    return 'Nome: $nome, Telefone: $telefone, Email: $email';
  }

  void imprimirDetalhe() {
    print('=== Detalhes do Contato ===');
    print('Nome: $nome');
    print('Telefone: $telefone');
    print('Email: $email');
  }

  void editarEspecial() {
    print('\nEste contato não possui campo extra para editar.');
  }

  String serializar() {
    return 'C;$nome;$telefone;$email';
  }
}
