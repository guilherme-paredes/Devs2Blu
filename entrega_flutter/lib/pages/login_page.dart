import 'package:entrega_flutter/pages/signup_page.dart';
import 'package:entrega_flutter/shared/app_text_styles.dart';
import 'package:entrega_flutter/shared/widgets/app_elevated_button.dart';
import 'package:entrega_flutter/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String route = '/login';

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
              Text('+DevsEcomm', style: AppTextStyles.title),
              Spacer(flex: 2),
              AppTextField(hintText: 'email@dominio.com'),
              AppTextField(hintText: '*****************'),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: TextButton(
                  onPressed: () => {},
                  child: Text('Esqueci minha senha'),
                ),
              ),
              AppElevatedButton(
                onPressed: () => {},
                label: 'Entrar',
                type: ButtonType.filled,
              ),
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
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Termos de serviço',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: ' e ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'Politicas de Privacidade',
                        style: TextStyle(color: Colors.black),
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
    );
  }
}
