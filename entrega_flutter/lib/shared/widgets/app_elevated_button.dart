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
    this.backgroundColor, 
    this.isLoading = false,
  });

  final String label;
  final ButtonType type;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final bool isLoading;

 @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: _getStyle(),
      child: isLoading ? SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color:  type == ButtonType.filled ? AppColors.white : AppColors.black,
        )
      )
      : Text(label),
    );
  }

  ButtonStyle _getStyle() {
    switch (type) {
      case ButtonType.filled:
        return ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48),
          foregroundColor: AppColors.white,
          backgroundColor: backgroundColor ?? AppColors.black,
          textStyle: AppTextStyles.buttonLabel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        );
      case ButtonType.unfilled:
        return ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48),
          foregroundColor: AppColors.black,
          backgroundColor: backgroundColor ?? AppColors.white,
          textStyle: AppTextStyles.buttonLabel,
          shape: RoundedRectangleBorder(
            side:BorderSide(color: AppColors.black),
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        );
    }
  }
}
