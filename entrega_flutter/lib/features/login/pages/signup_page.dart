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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  spacerBox,
                  Text('Crie uma conta', style: AppTextStyles.title),
                  Text(
                    'Insira seus dados para iniciar suas compras',
                    style: AppTextStyles.smalBlack,
                  ),
                  Spacer(),
                  AppTextField(
                    hintText: 'email@dominio.com',
                    onChanged: (value) {
                      setState(() {
                        signupController.setEmail(value);
                      });
                    },
                  ),

                  spacerBox,
                  AppTextField(
                    hintText: 'Nome',
                    onChanged: (value) {
                      setState(() {
                        signupController.setNome(value);
                      });
                    },
                  ),
                  spacerBox,
                  AppTextField(
                    hintText: 'Senha',
                    onChanged: (value) {
                      setState(() {
                        signupController.setSenha(value);
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
                  spacerBox,
                  AppTextField(
                    hintText: 'Confirmar Senha',
                    onChanged: (value) {
                      setState(() {
                        signupController.setConfirmSenha(value);
                      });
                    },
                  ),
                  Spacer(flex: 6),
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
                  Spacer(),
                  AppElevatedButton(
                    label: 'continuar',
                    onPressed: signupController.isActiveButton ? () {} : null,
                    type: ButtonType.filled,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
