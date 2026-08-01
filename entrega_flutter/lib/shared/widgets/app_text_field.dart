import 'package:entrega_flutter/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField({super.key, required this.hintText, this.padding});

  final String hintText;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: TextField(
        decoration: InputDecoration(
          // suffixIcon: Icon(Icons.visibility),
          // fillColor: AppColors.black,
          // filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.grey100),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.grey100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.grey100),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.errorRed),
          ),
        ),
      ),
    );
  }
}
