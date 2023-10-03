import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class CustomTextStyles {
  static TextStyle headerTextStyle = TextStyle(
      color: AppColor.white, fontWeight: FontWeight.w900, fontSize: 16);
  static TextStyle headerTextStyle2 = GoogleFonts.lato(
    textStyle: TextStyle(
        letterSpacing: .5,
        color: AppColor.white,
        fontWeight: FontWeight.w900,
        fontSize: 16),
  );

  static TextStyle buttonTextStyle = TextStyle(
      color: AppColor.white, fontWeight: FontWeight.w900, fontSize: 16);
  static TextStyle hintStyle = TextStyle(
      color: AppColor.black.withOpacity(0.2), fontSize: 12, letterSpacing: 0);
  static TextStyle normalWhiteText =
      TextStyle(color: AppColor.white, fontSize: 12, letterSpacing: 0);
}
