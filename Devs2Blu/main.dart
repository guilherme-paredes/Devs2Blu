import 'dart:io';
import 'contato.dart';
import 'agenda.dart';

Agenda agenda = Agenda();

Contato contato = Contato('', '', '');

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
        adicionar();
        break;
      case '2':
        listar();
        break;
      case '3':
        editar();
        break;
      case '4':
        remover();
        break;
      case '5':
        salvarAgenda();
        break;
      case '6':
        buscar();
        break;
      case '7':
        exibirHistorico();
        break;
      case '8':
        carregarAgenda();
        break;
      case '9':
        print('Saindo...');
        return;
      default:
        print('Opção inválida. Tente novamente.');
    }
  }
}
