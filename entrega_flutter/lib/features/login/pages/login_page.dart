import 'package:entrega_flutter/features/login/controllers/login_controller.dart';
import 'package:entrega_flutter/features/login/pages/signup_page.dart';
import 'package:entrega_flutter/shared/app_text_styles.dart';
import 'package:entrega_flutter/shared/widgets/app_checkbox.dart';
import 'package:entrega_flutter/shared/widgets/app_elevated_button.dart';
import 'package:entrega_flutter/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = LoginController();

  final SizedBox spacerBox = SizedBox(height: 16);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                      ),
                    ),
                  ),
                  spacerBox,
                  Center(child: Text('+DevsEcomm', style: AppTextStyles.title)),
                  Spacer(flex: 2),
                  AppTextField(
                    hintText: 'email@dominio.com',
                    onChanged: (value) {
                      setState(() {
                        loginController.setEmail(value);
                      });
                    },
                  ),
                  spacerBox,
                  AppTextField(
                    hintText: '*****************',
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        loginController.setSenha(value);
                      });
                    },
                  ),
                  Row(
                    children: [
                      AppCheckBox(
                        value: loginController.isActiveCheckBox,
                        onChanged: (value) => {
                          setState(() {
                            loginController.changeActiveCheckBox();
                          }),
                        },
                      ),
                      Text('Lembrar-me'),
                    ],
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: TextButton(
                      onPressed: () => {},
                      child: Text(
                        'Esqueci minha senha',
                        style: AppTextStyles.smalBlack,
                      ),
                    ),
                  ),
                  spacerBox,
                  AppElevatedButton(
                    onPressed: loginController.isActiveButton ? () {} : null,
                    label: 'Entrar',
                    type: ButtonType.filled,
                  ),
                  spacerBox,
                  AppElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignupPage.route);
                    },
                    label: 'Cadastrar',
                    type: ButtonType.unfilled,
                  ),
                  const Spacer(flex: 2),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Termos de serviço',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: ' e ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: 'Politicas de Privacidade',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
