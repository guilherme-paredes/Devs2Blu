import 'dart:io';
import 'contato.dart';
import 'contatoPessoal.dart';
import 'contatoEmpresarial.dart';

class Agenda {
  final List<Contato> _contatos;
  final List<String> _historico = [];

  Agenda([List<Contato>? contatos]) : _contatos = contatos ?? [];

  List<Contato> get contatos => List.unmodifiable(_contatos);
  List<String> get historico => List.unmodifiable(_historico);

  bool indiceValido(int i) {
    return i >= 0 && i < _contatos.length;
  }

  void adicionar() {
    print('Escolha o tipo de contato:');
    print('1. Contato Pessoal');
    print('2. Contato Empresarial');
    stdout.write('Digite a opção desejada: ');
    String opcao = stdin.readLineSync() ?? '';

    String nome = lerNome();
    if (existe(nome)) {
      print('\nContato já existe.');
      return;
    }

    String telefone = lerTelefone();
    String email = lerEmail();
    Contato contato;

    if (opcao == '1') {
      stdout.write('\nDigite o apelido: ');
      String apelido = (stdin.readLineSync() ?? '').trim();
      contato = ContatoPessoal(apelido, nome, telefone, email);
    } else if (opcao == '2') {
      stdout.write('\nDigite a empresa: ');
      String empresa = (stdin.readLineSync() ?? '').trim();
      contato = ContatoEmpresarial(nome, telefone, email, empresa);
    } else {
      print('\nOpção inválida. Contato não adicionado.');
      return;
    }

    _contatos.add(contato);
    _historico.add('Contato adicionado: ${contato.imprimir()}');
    print('\nContato adicionado com sucesso!');
  }

  String lerNome() {
    while (true) {
      stdout.write('\nDigite o nome: ');
      String nome = (stdin.readLineSync() ?? '').trim();
      if (nome.isNotEmpty) {
        return nome;
      } else {
        print('\nNome não pode ser vazio. Tente novamente.');
      }
    }
  }

  bool existe(String nome) {
    for (Contato c in _contatos) {
      if (c.nome.toLowerCase() == nome.toLowerCase()) {
        return true;
      }
    }
    return false;
  }

  String lerTelefone() {
    while (true) {
      stdout.write('\nDigite o telefone de 10 ou 11 numeros: ');
      String telefone = (stdin.readLineSync() ?? '').trim();
      if (telefone.isNotEmpty &&
          (telefone.length == 10 || telefone.length == 11)) {
        return telefone;
      } else {
        print(
          '\nTelefone não pode ser vazio ou menor que 10 ou 11 numeros. Tente novamente.',
        );
      }
    }
  }

  String lerEmail() {
    while (true) {
      stdout.write('\nDigite o email: ');
      String email = (stdin.readLineSync() ?? '').trim();
      if (email.isNotEmpty && email.contains('@')) {
        return email;
      } else {
        print('\nEmail não pode ser vazio e deve conter "@". Tente novamente.');
      }
    }
  }

  void listar() {
    if (_contatos.isEmpty) {
      print('\nNenhum contato cadastrado.');
      return;
    }

    print('\nLista de contatos:');
    for (int i = 0; i < _contatos.length; i++) {
      print('${i + 1}. ${_contatos[i].imprimir()}');
    }
  }

  void editar() {
    if (_contatos.isEmpty) {
      print('\nNenhum contato cadastrado.');
      return;
    }

    listar();
    stdout.write('\nDigite o índice do contato que deseja editar: ');
    int i = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
    i--;

    if (!indiceValido(i)) {
      print('\nÍndice inválido.');
      return;
    }

    print('\nSelecionado: ${_contatos[i].imprimir()}');
    print('\nQual campo deseja editar?');
    print('1. Nome');
    print('2. Telefone');
    print('3. Email');
    print('4. Campo específico do tipo de contato');
    stdout.write('Escolha uma opção: ');
    String opcao = stdin.readLineSync() ?? '';

    switch (opcao) {
      case '1':
        _contatos[i].nome = lerNome();
        print('\nNome atualizado com sucesso!');
        break;
      case '2':
        _contatos[i].telefone = lerTelefone();
        print('\nTelefone atualizado com sucesso!');
        break;
      case '3':
        _contatos[i].email = lerEmail();
        print('\nEmail atualizado com sucesso!');
        break;
      case '4':
        _contatos[i].editarEspecial();
        break;
      default:
        print('\nOpção inválida. Tente novamente.');
        return;
    }

    _historico.add('Contato atualizado: ${_contatos[i].imprimir()}');
    print('\nContato atualizado com sucesso!');
  }

  void remover() {
    if (_contatos.isEmpty) {
      print('\nNenhum contato cadastrado.');
      return;
    }

    listar();
    stdout.write('\nDigite o índice do contato que deseja remover: ');
    int i = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
    i--;

    if (!indiceValido(i)) {
      print('\nÍndice inválido.');
      return;
    }

    stdout.write(
      '\nTem certeza que deseja remover o contato ${_contatos[i].nome}? (s/n): ',
    );
    String confirmacao = (stdin.readLineSync() ?? '').toLowerCase();

    if (confirmacao != 's') {
      print('\nOperação cancelada.');
      return;
    }

    final removido = _contatos.removeAt(i);
    _historico.add('Contato removido: ${removido.imprimir()}');
    print('\nContato removido com sucesso!');
  }

  void buscar() {
    stdout.write('\nDigite o nome do contato que deseja buscar: ');
    String nomeBusca = (stdin.readLineSync() ?? '').toLowerCase();

    bool encontrado = false;
    for (int i = 0; i < _contatos.length; i++) {
      if (_contatos[i].nome.toLowerCase().contains(nomeBusca)) {
        print('\nContato encontrado:');
        _contatos[i].imprimirDetalhe();
        encontrado = true;
        break;
      }
    }

    if (!encontrado) {
      print('\nContato não encontrado.');
    }
  }

  void exibirHistorico() {
    if (_historico.isEmpty) {
      print('\nNenhum histórico de contatos.');
      return;
    }

    print('\nHistórico de contatos:');
    for (String registro in _historico) {
      print(registro);
    }
  }

  void salvarAgenda() {
    List<String> linhas = [];
    File arquivo = File('agenda.txt');

    for (final contato in _contatos) {
      linhas.add(contato.serializar());
    }

    arquivo.writeAsStringSync(linhas.join('\n'));
    print('\nAgenda salva com sucesso em agenda.txt!');
  }

  void carregarAgenda() {
    File arquivo = File('agenda.txt');
    if (!arquivo.existsSync()) {
      print('\nArquivo agenda.txt não encontrado.');
      return;
    }

    List<String> linhas = arquivo.readAsLinesSync();
    _contatos.clear();

    for (final linha in linhas) {
      if (linha.trim().isEmpty) continue;
      final campos = linha.split(';');
      if (campos.length < 4) continue;

      if (campos[0] == 'P' && campos.length == 5) {
        _contatos.add(ContatoPessoal.fromCsv(campos));
      } else if (campos[0] == 'E' && campos.length == 5) {
        _contatos.add(ContatoEmpresarial.fromCsv(campos));
      }
    }

    _historico.add('Agenda carregada do arquivo agenda.txt');
    print('\nLista de contatos carregada com sucesso de agenda.txt!');
  }
}
