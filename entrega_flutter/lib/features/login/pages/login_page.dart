import 'package:entrega_flutter/features/login/controllers/login_controller.dart';
import 'package:entrega_flutter/features/login/pages/recover_page.dart';
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
  final GlobalKey<FormState> key =GlobalKey<FormState>();
  final SizedBox spacerBox = SizedBox(height: 16);

  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleLogin() async{
    if(key.currentState!.validate()){
      setState(() {
        loginController.isLoading = true;
      });

    await loginController.login();
    setState(() {
      loginController.isLoading = false;
    });

    }
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
              child: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(),
                    Image.asset('assets/images/login.png', height: 120),
                    spacerBox,
                    Center(
                      child: Text('+DevsEcomm', style: AppTextStyles.title),
                      ),
                    Spacer(flex: 2),
                    AppTextField(
                      controller: loginController.emailController,
                      validator: (value){
                        return loginController.validateEmail(value);
                      },
                      hintText: 'email@dominio.com',
                    ),
                    spacerBox,

                    AppTextField(
                      controller: loginController.senhaController,
                      validator: (value){
                        return loginController.validateSenha(value);
                      },
                      hintText: '*****************',
                      obscureText: true,
                      
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
                        onPressed: () => {
                          Navigator.pushNamed(context, RecoverPage.route),
                        },
                        child: Text(
                          'Esqueci minha senha',
                          style: AppTextStyles.smalBlack,
                        ),
                      ),
                    ),
                    spacerBox,
                    AppElevatedButton(
                      onPressed: _handleLogin,
                      label: 'Entrar',
                      isLoading: loginController.isLoading,
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
                      child: RichText(
                        textAlign: TextAlign.center,
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
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
