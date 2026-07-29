import 'package:app_flutter/modules/login/pages/login_screen.dart';
import 'package:app_flutter/modules/telas_testes/tela_1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado - Carrinho',
      home: const Tela1(),
    );
  }
}

