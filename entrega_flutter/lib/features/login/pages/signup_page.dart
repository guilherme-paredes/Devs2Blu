import 'package:entrega_flutter/shared/app_text_styles.dart';
import 'package:entrega_flutter/shared/widgets/app_checkbox.dart';
import 'package:entrega_flutter/shared/widgets/app_elevated_button.dart';
import 'package:entrega_flutter/shared/widgets/app_required_password.dart';
import 'package:entrega_flutter/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:entrega_flutter/features/login/controllers/signup_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SizedBox spacerBox = SizedBox(height: 16);

  SignupController signupController = SignupController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro'), centerTitle: true,),
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal:24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  spacerBox,
                  Text('Criar uma conta', 
                  style: AppTextStyles.title, 
                  textAlign: TextAlign.center,),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Insira seus dados para iniciar suas compras',
                      style: AppTextStyles.smalBlack,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 32),
                  AppTextField(
                    hintText: 'email@dominio.com',
                    onChanged: (value) {
                      setState(() {
                        signupController.setEmail(value);
                      });
                    },
                  ),

                  SizedBox(height: 16,),
                  AppTextField(
                    hintText: 'Nome',
                    onChanged: (value) {
                      setState(() {
                        signupController.setNome(value);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    hintText: 'Senha',
                    onChanged: (value) {
                      setState(() {
                        signupController.setSenha(value);
                      });
                    },
                    obscureText: true,
                  ),
                  
                  SizedBox(height: 16),
                  AppTextField(
                    hintText: 'Confirmar Senha',
                    onChanged: (value) {
                      setState(() {
                        signupController.setConfirmSenha(value);
                      });
                    },
                    obscureText: true,
                  ),
                  for (var requiremnt
                      in signupController.getPasswordRequirements())
                    AppRequiredPassword(
                      atendido: requiremnt.values.first,
                      text: requiremnt.keys.first,
                    ),
                  Spacer(),
                  Row(
                    children: [
                      AppCheckBox(
                        value: signupController.isActiveCheckBox,
                        onChanged: (value) => {
                          setState(() {
                            signupController.changeActiveCheckBox();
                          }),
                        },
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {},
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Ao clicar em continuar, você concorda com os nossos ',
                                  style: AppTextStyles.smalMediunGrey,
                                ),
                                TextSpan(
                                  text: 'Termos de Serviço',
                                  style: AppTextStyles.smalBlack,
                                ),
                                TextSpan(
                                  text: ' e com a ',
                                  style: AppTextStyles.smalMediunGrey,
                                ),
                                TextSpan(
                                  text: 'Politica de privacidade',
                                  style: AppTextStyles.smalBlack,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  AppElevatedButton(
                    label: 'continuar',
                    isLoading: signupController.isLoading,
                    onPressed: signupController.isActiveButton ? () async{
                      setState(() {
                        signupController.isLoading = true;
                      });
                      await signupController.signUp();
                      
                      setState(() {
                        signupController.isLoading = false;
                      });
                    }
                    : null,
                    type: ButtonType.filled,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
  }
}
