abstract class Contato {
  String nome;
  String telefone;
  String email;

  Contato(this.nome, this.telefone, this.email);

  String imprimir() {
    return 'Nome: $nome, Telefone: $telefone, Email: $email';
  }

  void editarEspecial() {
    print('\nEste contato não possui campo extra para editar.');
  }

  String serializar() {
    return 'C;$nome;$telefone;$email';
  }
}
