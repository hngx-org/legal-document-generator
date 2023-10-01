import 'package:flutter/material.dart';
import 'app_colors.dart';

class CustomTextStyles {
  static  TextStyle headerTextStyle = TextStyle(color: AppColors.black, fontWeight: FontWeight.w900, fontSize: 16);
  static  TextStyle buttonTextStyle = TextStyle(color: AppColors.white, fontWeight: FontWeight.w900, fontSize: 16);
  static TextStyle hintStyle = TextStyle(
      color: AppColors.black.withOpacity(0.2),
      fontSize: 12,
      letterSpacing: 0);
}