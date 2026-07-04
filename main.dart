import 'dart:io';

List<String> nomes = [];
List<String> telefones = [];
List<String> emails = [];
List<String> historico = [];

bool indiceValido(int i) {
  return i >= 0 && i < nomes.length;
}

//codigos para adicionar um contato na agenda com validação de nome, telefone e email
void adicionar() {
  String nome = lerNome();
  if (existe(nome)) {
    print('\nContato já existe.');
    return;
  }
  nomes.add(nome);

  String telefone = lerTelefone();
  telefones.add(telefone);

  String email = lerEmail();
  emails.add(email);

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
  for (String n in nomes) {
    if (n.toLowerCase() == nome.toLowerCase()) {
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
  if (nomes.isEmpty) {
    print('\nNenhum contato cadastrado.');
    return;
  }

  print('\nLista de contatos:');
  for (int i = 0; i < nomes.length; i++) {
    print(
      '${i + 1}. Nome: ${nomes[i]}, Telefone: ${telefones[i]}, Email: ${emails[i]}',
    );
  }
}

//Codigo para editar um contato da agenda com validador e opção de escolher qual campo deseja editar
void editar() {
  if (nomes.isEmpty) {
    print('\nNenhum contato cadastrado.');
    return;
  }

  listar();
  stdout.write('\nDigite o índice do contato que deseja editar: ');
  int i = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  i--;

  if (indiceValido(i)) {
    print('\nselecionado: $nomes[1], $telefones[2], $emails[3] ');
    print('\nQual campo deseja editar?');
    print('1. Nome');
    print('2. Telefone');
    print('3. Email');
    stdout.write('Escolha uma opção: ');
    String? opcao = stdin.readLineSync() ?? '';

    switch (opcao) {
      case '1':
        String novoNome = lerNome();
        nomes[i] = novoNome;
        print('\nNome atualizado com sucesso!');
        break;
      case '2':
        String novoTelefone = lerTelefone();
        telefones[i] = novoTelefone;
        print('\nTelefone atualizado com sucesso!');
        break;
      case '3':
        String novoEmail = lerEmail();
        emails[i] = novoEmail;
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
    'Contato atualizado: ${nomes[i]}, ${telefones[i]}, ${emails[i]}',
  );
  print('\nContato atualizado com sucesso!');
}

//Codigo para remover um contato da agenda com confirmação
void remover() {
  listar();
  if (nomes.isEmpty) {
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
    '\nTem certeza que deseja remover o contato ${nomes[i]}? (s/n): ',
  );
  String confirmacao = (stdin.readLineSync() ?? '').toLowerCase();

  if (confirmacao != 's') {
    print('\nOperação cancelada.');
    return;
  }

  nomes.removeAt(i);
  telefones.removeAt(i);
  emails.removeAt(i);

  historico.add('Contato removido: ${nomes[i]}, ${telefones[i]}, ${emails[i]}');
  print('\nContato removido com sucesso!');
}

//Codigo para buscar um contato da agenda
void buscar() {
  stdout.write('\nDigite o nome do contato que deseja buscar: ');
  String nomeBusca = (stdin.readLineSync() ?? '').toLowerCase();

  bool encontrado = false;
  for (int i = 0; i < nomes.length; i++) {
    if (nomes[i].toLowerCase().contains(nomeBusca)) {
      print('\nContato encontrado:');
      print(
        'Nome: ${nomes[i]}, Telefone: ${telefones[i]}, Email: ${emails[i]}',
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

  for (int i = 0; i < nomes.length; i++) {
    linhas.add('${nomes[i]};${telefones[i]};${emails[i]}');
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
  nomes.clear();
  telefones.clear();
  emails.clear();

  for (String linha in linhas) {
    if (linha.trim().isEmpty) {
      print(
        'A lista de contatos está com informações incompletas. Por favor, verifique o arquivo agenda.txt.',
      );
    }
    List<String> campos = linha.split(';');
    if (campos.length == 3) {
      nomes.add(campos[0]);
      telefones.add(campos[1]);
      emails.add(campos[2]);
    }
  }
  historico.add('Agenda carregada do arquivo agenda.txt');
  print('\nLista de contatos carregada com sucesso de agenda.txt!');
}

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
