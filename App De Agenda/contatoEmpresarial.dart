import 'dart:io';
import 'contato.dart';

class ContatoEmpresarial extends Contato {
  String empresa;

  ContatoEmpresarial(String nome, String telefone, String email, this.empresa)
    : super(nome, telefone, email);

  @override
  String imprimir() {
    return '${super.imprimir()}, Empresa: $empresa';
  }

  @override
  void imprimirDetalhe() {
    super.imprimirDetalhe();
    print('Empresa: $empresa');
  }

  @override
  void editarEspecial() {
    stdout.write('\nDeseja editar a empresa? (s/n): ');
    final resposta = (stdin.readLineSync() ?? '').toLowerCase();
    if (resposta == 's') {
      stdout.write('\nDigite a nova empresa: ');
      empresa = (stdin.readLineSync() ?? '').trim();
      print('\nEmpresa atualizada com sucesso!');
    }
  }

  @override
  String serializar() {
    return 'E;$nome;$telefone;$email;$empresa';
  }

  static ContatoEmpresarial fromCsv(List<String> campos) {
    return ContatoEmpresarial(campos[1], campos[2], campos[3], campos[4]);
  }
}
