class SignupController {
  String email = '';
  String senha = '';
  String nome = '';
  String confirmSenha = '';
  bool isActiveButton = false;
  bool isActiveCheckBox = false;
  bool isOk = false;

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
        nome.trim().isNotEmpty &&
        senha.trim().isNotEmpty &&
        confirmSenha.trim().isNotEmpty &&
        isActiveCheckBox;
    isActiveCheckBox &&
        minSeisCaracteres &&
        possuiCaractereEspecial &&
        possuiLetraMaiuscula &&
        possuiLetraMinuscula &&
        senhasCoincidentes;
  }

  List<Map<String, bool>> getPasswordRequirements() {
    return [
      {'Mínimo de 6 caracteres': minSeisCaracteres},
      {'No mínimo um caracter especial': possuiCaractereEspecial},
    ];
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
    changeActiveButton();
  }

  bool get possuiLetraMaiuscula => senha.contains(RegExp(r'[A-Z]'));
  bool get possuiLetraMinuscula => senha.contains(RegExp(r'[a-z]'));
  bool get senhasCoincidentes => senha == confirmSenha && senha.isNotEmpty;
  bool get minSeisCaracteres => senha.length >= 6;
  bool get possuiCaractereEspecial =>
      senha.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}
