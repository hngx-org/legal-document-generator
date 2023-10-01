import 'package:flutter/material.dart';
import 'app_colors.dart';

class CustomTextStyles {
  static  TextStyle headerTextStyle = TextStyle(color: AppColor.black, fontWeight: FontWeight.w900, fontSize: 16);
  static  TextStyle buttonTextStyle = TextStyle(color: AppColor.white, fontWeight: FontWeight.w900, fontSize: 16);
  static TextStyle hintStyle = TextStyle(
      color: AppColor.black.withOpacity(0.2),
      fontSize: 12,
      letterSpacing: 0);
}