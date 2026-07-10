import 'dart:io';
import 'contato.dart';
import 'contatoPessoal.dart';
import 'contatoEmpresarial.dart';
import 'agenda.dart';

// Contato contato = ContatoPessoal('', '', '');
Agenda agenda = Agenda([]);

void main(List<String> args) {
  while (true) {
    print('\nAgenda de Contatos\n');
    print('1. Adicionar contato');
    print('2. Listar contatos');
    print('3. Editar contato');
    print('4. Remover contato');
    print('5. Salvar agenda');
    print('6. Buscar contato');
    print('7. Exibir histórico');
    print('8. Carregar agenda');
    print('9. Sair');
    stdout.write('\nEscolha uma opção: ');
    String? opcao = stdin.readLineSync() ?? '';

    switch (opcao) {
      case '1':
        agenda.adicionar();
        break;
      case '2':
        agenda.listar();
        break;
      case '3':
        agenda.editar();
        break;
      case '4':
        agenda.remover();
        break;
      case '5':
        agenda.salvarAgenda();
        break;
      case '6':
        agenda.buscar();
        break;
      case '7':
        agenda.exibirHistorico();
        break;
      case '8':
        agenda.carregarAgenda();
        break;
      case '9':
        print('Saindo...');
        return;
      default:
        print('Opção inválida. Tente novamente.');
    }
  }
}
