import 'package:entrega_flutter/pages/signup_page.dart';
import 'package:entrega_flutter/shared/app_text_styles.dart';
import 'package:entrega_flutter/shared/widgets/app_elevated_button.dart';
import 'package:entrega_flutter/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static String route = '/login';

  final SizedBox spacerBox = SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              Text(
                '+DevsEcomm',
                style: AppTextStyles.title,
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 2),
              AppTextField(hintText: 'email@dominio.com'),
              spacerBox,
              AppTextField(hintText: '*****************', obscureText: true),
              spacerBox,
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: TextButton(
                  onPressed: () => {},
                  child: Text('Esqueci minha senha'),
                ),
              ),
              spacerBox,
              AppElevatedButton(
                onPressed: () => {},
                label: 'Entrar',
                type: ButtonType.filled,
              ),
              spacerBox,
              AppElevatedButton(
                onPressed: () => {
                  Navigator.pushNamed(context, SignupPage.route),
                },
                label: 'Cadastrar',
                type: ButtonType.unfilled,
              ),
              Spacer(flex: 2),
              GestureDetector(
                onTap: () => {},
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Termos de serviço',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        TextSpan(
                          text: ' e ',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        TextSpan(
                          text: 'Politicas de Privacidade',
                          style: TextStyle(color: Colors.black, fontSize: 16),
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
    );
  }
}
