import 'dart:convert';
import 'dart:io';
import 'aluno.dart';
import 'turma.dart';
import 'nota.dart';
void main(){

  Aluno aluno = Aluno('nome');


  print(jsonEncode(aluno.toMap()));


  Aluno.fromMap(jsonDecode('''
  {"ngme":"vitor"}
'''));
}
// void main() {
//   var turma = Turma();
//   var opcao = '';

//   while (opcao != '0') {
//     print('\n===== MENU =====');
//     print('1 - Cadastrar aluno');
//     print('2 - Lançar nota');
//     print('3 - Listar alunos');
//     print('4 - Exportar JSON');
//     print('0 - Sair');
//     stdout.write('Escolha uma opção: ');

//     opcao = stdin.readLineSync() ?? '';

//     switch (opcao) {
//       case '1':
//         cadastrarAluno(turma);
//         break;
//       case '2':
//         lancarNota(turma);
//         break;
//       case '3':
//         turma.listar();
//         break;
//       case '4':
//         print(turma.exportarJson());
//         break;
//       case '0':
//         print('Saindo...');
//         break;
//       default:
//         print('Opção inválida.');
//     }
//   }
// }

// void cadastrarAluno(Turma turma) {
//   stdout.write('Nome do aluno: ');
//   var nome = stdin.readLineSync() ?? '';
//   turma.cadastrarAluno(nome);
//   print('Aluno cadastrado!');
// }

// void lancarNota(Turma turma) {
//   turma.listar();

//   stdout.write('Número do aluno: ');
//   var indiceTexto = stdin.readLineSync() ?? '';
//   var indice = int.tryParse(indiceTexto);

//   if (indice == null) {
//     print('Número inválido.');
//     return;
//   }

//   print('Tipo de nota:');
//   print('1 - Prova');
//   print('2 - Trabalho');
//   stdout.write('Escolha: ');
//   var tipo = stdin.readLineSync() ?? '';

//   stdout.write('Valor da nota: ');
//   var valorTexto = stdin.readLineSync() ?? '';
//   var valor = double.tryParse(valorTexto);

//   if (valor == null) {
//     print('Valor inválido.');
//     return;
//   }

//   stdout.write('Descrição: ');
//   var descricao = stdin.readLineSync() ?? '';

//   Nota nota;
//   if (tipo == '1') {
//     nota = NotaProva(valor, descricao);
//   } else {
//     nota = NotaTrabalho(valor, descricao);
//   }

//   turma.lancarNota(indice, nota);
//   print('Nota lançada!');
// }
