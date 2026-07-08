import 'contato.dart';
import 'dart:io';

class Agenda {
  List<Contato> _contatos = [];
  List<String> historico = [];

  Agenda(this._contatos);


  bool indiceValido(int i) {
  return i >= 0 && i < _contatos.length;
}

//codigos para adicionar um contato na agenda com validação de nome, telefone e email
void adicionar() {
  String nome = lerNome();
  if (existe(nome)) {
    print('\nContato já existe.');
    return;
  }
  String telefone = lerTelefone();
  String email = lerEmail();

Contato contato = Contato(nome, telefone, email);
  _contatos.add(contato);


  historico.add('Contato adicionado: $nome, $telefone, $email');

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
    if (c.getnome().toLowerCase() == nome.toLowerCase()) {
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


//Codigo para listar os contatos da agenda
void listar() {
  if (_contatos.isEmpty) {
    print('\nNenhum contato cadastrado.');
    return;
  }

  print('\nLista de contatos:');
  for (int i = 0; i < _contatos.length; i++) {
    print(
      '${i + 1}. Nome: ${_contatos[i].getnome()}, Telefone: ${_contatos[i].gettelefone()}, Email: ${_contatos[i].getemail()}',
    );
  }
}

//Codigo para editar um contato da agenda com validador e opção de escolher qual campo deseja editar
void editar() {
  if (_contatos.isEmpty) {
    print('\nNenhum contato cadastrado.');
    return;
  }

  listar();
  stdout.write('\nDigite o índice do contato que deseja editar: ');
  int i = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  i--;

  if (indiceValido(i)) {
    print('\nselecionado: ${_contatos[i].getnome()}, ${_contatos[i].gettelefone()}, ${_contatos[i].getemail()}');
    print('\nQual campo deseja editar?');
    print('1. Nome');
    print('2. Telefone');
    print('3. Email');
    stdout.write('Escolha uma opção: ');
    String? opcao = stdin.readLineSync() ?? '';

    switch (opcao) {
      case '1':
        String novoNome = lerNome();
        _contatos[i].setnome(novoNome);
        print('\nNome atualizado com sucesso!');
        break;
      case '2':
        String novoTelefone = lerTelefone();
        _contatos[i].settelefone(novoTelefone);
        print('\nTelefone atualizado com sucesso!');
        break;
      case '3':
        String novoEmail = lerEmail();
        _contatos[i].setemail(novoEmail);
        print('\nEmail atualizado com sucesso!');
        break;
      default:
        print('\nOpção inválida. Tente novamente.');
    }
    if (!indiceValido(i)) {
      print('\nÍndice inválido.');
      return;
    }
  }
  historico.add(
    'Contato atualizado: ${_contatos[i].getnome()}, ${_contatos[i].gettelefone()}, ${_contatos[i].getemail()}',
  );
  print('\nContato atualizado com sucesso!');
}

//Codigo para remover um contato da agenda com confirmação
void remover() {
  listar();
  if (_contatos.isEmpty) {
    print('\nNenhum contato cadastrado.');
    return;
  }

  stdout.write('\nDigite o índice do contato que deseja remover: ');
  int i = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  i--;

  if (!indiceValido(i)) {
    print('\nÍndice inválido.');
    return;
  }

  stdout.write(
    '\nTem certeza que deseja remover o contato ${_contatos[i].getnome()}? (s/n): ',
  );
  String confirmacao = (stdin.readLineSync() ?? '').toLowerCase();

  if (confirmacao != 's') {
    print('\nOperação cancelada.');
    return;
  }

  contatos.removeAt(i);

  historico.add('Contato removido: ${contatos[i].getnome()}, ${contatos[i].gettelefone()}, ${contatos[i].getemail()}');
  print('\nContato removido com sucesso!');
}

//Codigo para buscar um contato da agenda
void buscar() {
  stdout.write('\nDigite o nome do contato que deseja buscar: ');
  String nomeBusca = (stdin.readLineSync() ?? '').toLowerCase();

  bool encontrado = false;
  for (int i = 0; i < _contatos.length; i++) {
    if (_contatos[i].getnome().toLowerCase().contains(nomeBusca)) {
      print('\nContato encontrado:');
      print(
        'Nome: ${_contatos[i].getnome()}, Telefone: ${_contatos[i].gettelefone()}, Email: ${_contatos[i].getemail()}',
      );
      encontrado = true;
      break;
    }
  }
  if (!encontrado) {
    print('\nContato não encontrado.');
  }
}

void exibirHistorico() {
  if (historico.isEmpty) {
    print('\nNenhum histórico de contatos.');
    return;
  }

  print('\nHistórico de contatos:');
  for (String registro in historico) {
    print(registro);
  }
}

//Metodopara salvara agenda em um arquivo de texto chamado "agenda.txt"
void salvarAgenda() {
  List<String> linhas = [];
  File arquivo = File('agenda.txt');

  for (int i = 0; i < _contatos.length; i++) {
    linhas.add('${_contatos[i].getnome()};${_contatos[i].gettelefone()};${_contatos[i].getemail()}');
  }

  arquivo.writeAsStringSync(linhas.join('\n'));
  print('\nAgenda salva com sucesso em agenda.txt!');
}

//Metodo para carregar a agenda do arquivo de texto "agenda.txt" ao iniciar o programa
void carregarAgenda() {
  File arquivo = File('agenda.txt');
  if (!arquivo.existsSync()) {
    print('\nArquivo agenda.txt não encontrado.');
    return;
  }
  List<String> linhas = arquivo.readAsLinesSync();
  _contatos.clear();

  for (String linha in linhas) {
    if (linha.trim().isEmpty) {
      print(
        'A lista de contatos está com informações incompletas. Por favor, verifique o arquivo agenda.txt.',
      );
    }
    List<String> campos = linha.split(';');
    if (campos.length == 3) {
      _contatos.add(Contato(
        campos[0],
         campos[1],
         campos[2]
      ));
    }
  }
  historico.add('Agenda carregada do arquivo agenda.txt');
  print('\nLista de contatos carregada com sucesso de agenda.txt!');
}
}