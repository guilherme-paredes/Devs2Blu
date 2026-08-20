import 'package:flutter/material.dart';

class LoginController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final int _caracterMinimoSenha = 6;
  bool isActiveCheckBox = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  bool isLoading = false;
  bool get isEmailValid => _emailRegex.hasMatch(emailController.text.trim());
  bool get isSenhaValid => senhaController.text.trim().length>= _caracterMinimoSenha;

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
  }

  Future<void> login() async{
    await Future.delayed(const Duration(seconds: 2));
  }

  String? validateEmail(String? value){
    if(_emailRegex.hasMatch(emailController.text)){
      return null;
    }
    return 'E-mail invalido';
  }
  
  String? validateSenha(String? value){
    if(senhaController.text.length >=_caracterMinimoSenha){
      return null;
    }
    return 'Senha invalida';
  }

}
