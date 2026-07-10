import 'dart:io';
import 'contato.dart';

class ContatoEmpresarial extends Contato {
  String razaoSocial;

  ContatoEmpresarial(String nome, String telefone, String email, this.razaoSocial)
      : super(nome, telefone, email);

  @override
  String imprimir() {
    return '${super.imprimir()}, Razão social: $razaoSocial';
  }

  @override
  void editarEspecial() {
    stdout.write('\nDeseja editar a razão social? (s/n): ');
    final resposta = (stdin.readLineSync() ?? '').toLowerCase();
    if (resposta == 's') {
      stdout.write('\nDigite a nova razão social: ');
      razaoSocial = (stdin.readLineSync() ?? '').trim();
      print('\nRazão social atualizada com sucesso!');
    }
  }

  @override
  String serializar() {
    return 'E;$nome;$telefone;$email;$razaoSocial';
  }

  static ContatoEmpresarial fromCsv(List<String> campos) {
    return ContatoEmpresarial(campos[1], campos[2], campos[3], campos[4]);
  }
}
