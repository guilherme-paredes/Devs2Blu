import 'package:entrega_flutter/shared/app_colors.dart';
import 'package:entrega_flutter/shared/app_text_styles.dart';
import 'package:flutter/material.dart';

enum ButtonType { filled, unfilled }

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({super.key, required this.label, required this.type});

  final String label;
  final ButtonType type;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      child: Text(label),
      style: type == ButtonType.filled
          ? ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(48),
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.black,
              textStyle: AppTextStyles.buttonLabel,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(14),
              ),
            )
          : ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(48),
              foregroundColor: AppColors.black,
              backgroundColor: AppColors.white,
              textStyle: AppTextStyles.buttonLabel,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(14),
              ),
            ),
    );
  }
}
