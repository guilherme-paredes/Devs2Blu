import 'dart:ffi';

import 'package:flutter/material.dart';

class SignupController {
  String email = '';
  String senha = '';
  String nome = '';
  String confirmSenha = '';
  bool isActiveButton = false;
  bool isActiveCheckBox = false;

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void setNome(String nomeParam) {
    nome = nomeParam;
    changeActiveButton();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  void setConfirmSenha(String confirmSenhaParam) {
    confirmSenha = confirmSenhaParam;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton =
        email.trim().isNotEmpty &&
        senha.trim().isNotEmpty &&
        confirmSenha.trim().isNotEmpty &&
        senha == confirmSenha &&
        isActiveCheckBox;
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
    changeActiveButton();
  }
}
