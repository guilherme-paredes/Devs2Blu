import 'package:entrega_flutter/shared/app_text_styles.dart';
import 'package:entrega_flutter/shared/widgets/app_elevated_button.dart';
import 'package:entrega_flutter/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  static String route = '/signup';

  final SizedBox spacerBox = SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
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
              AppTextField(hintText: 'email@dominio.com'),
              spacerBox,
              AppTextField(hintText: 'Nome'),
              spacerBox,
              AppTextField(hintText: 'Senha'),
              spacerBox,
              AppTextField(hintText: 'Confirmar Senha'),
              Spacer(flex: 6),
              Align(
                alignment: AlignmentGeometry.bottomCenter,
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
              Spacer(),
              AppElevatedButton(
                onPressed: () => {},
                label: 'continuar',
                type: ButtonType.filled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
