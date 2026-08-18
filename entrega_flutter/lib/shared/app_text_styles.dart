import 'package:entrega_flutter/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonLabel = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle smalBlack = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle smalMediunGrey = TextStyle(
    color: AppColors.grey140,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle smallGrey = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );

  static final TextStyle smallGreen = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.green,
  );
}
