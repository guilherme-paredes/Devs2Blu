import 'package:entrega_flutter/features/login/controllers/recover_controller.dart';
import 'package:flutter/material.dart';
import 'package:entrega_flutter/shared/app_text_styles.dart';
import 'package:entrega_flutter/shared/widgets/app_elevated_button.dart';
import 'package:entrega_flutter/shared/widgets/app_text_field.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class RecoverPage extends StatefulWidget {
  const RecoverPage({super.key});

  static const String route = '/recover';

  @override
  State<RecoverPage> createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  RecoverController recoverController = RecoverController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text('Recuperar senha', style: AppTextStyles.title),
                  AppTextField(
                    hintText: 'email@dominio.com',
                    onChanged: (value) {
                      setState(() {
                        recoverController.setEmail(value);
                      });
                    },
                  ),
                  Spacer(),
                  AppElevatedButton(
                    label: 'Continuar',
                    type: ButtonType.filled,
                    onPressed: recoverController.isActiveButton
                        ? () {
                            AnimatedSnackBar.material(
                              'Código enviado com sucesso',
                              type: AnimatedSnackBarType.success,
                              mobileSnackBarPosition:
                                  MobileSnackBarPosition.bottom,
                            ).show(context);
                          }
                        : null,
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
