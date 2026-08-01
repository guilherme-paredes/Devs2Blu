import 'package:entrega_flutter/shared/app_colors.dart';
import 'package:entrega_flutter/shared/app_text_styles.dart';
import 'package:flutter/material.dart';

enum ButtonType { filled, unfilled }

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.label,
    required this.type,
    this.onPressed,
  });

  final String label;
  final ButtonType type;
  final void Function()? onPressed;

  ButtonStyle _getStyle() {
    switch (type) {
      case ButtonType.filled:
        return ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48),
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.black,
          textStyle: AppTextStyles.buttonLabel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(14),
          ),
        );
      case ButtonType.unfilled:
        return ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48),
          foregroundColor: AppColors.black,
          backgroundColor: AppColors.white,
          textStyle: AppTextStyles.buttonLabel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(14),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _getStyle(),
      child: Text(label),
    );
  }
}
