import 'dart:io';
import 'contato.dart';

class ContatoPessoal extends Contato {
  String apelido;

  ContatoPessoal(this.apelido, String nome, String telefone, String email)
      : super(nome, telefone, email);

  @override
  String imprimir() {
    return '${super.imprimir()}, Apelido: $apelido';
  }

  @override
  void editarEspecial() {
    stdout.write('\nDeseja editar o apelido? (s/n): ');
    final resposta = (stdin.readLineSync() ?? '').toLowerCase();
    if (resposta == 's') {
      stdout.write('\nDigite o novo apelido: ');
      apelido = (stdin.readLineSync() ?? '').trim();
      print('\nApelido atualizado com sucesso!');
    }
  }

  @override
  String serializar() {
    return 'P;$nome;$telefone;$email;$apelido';
  }

  static ContatoPessoal fromCsv(List<String> campos) {
    return ContatoPessoal(campos[4], campos[1], campos[2], campos[3]);
  }
}

