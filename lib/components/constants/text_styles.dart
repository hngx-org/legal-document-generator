import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class CustomTextStyles {
  static TextStyle headerTextStyle = TextStyle(
    color: AppColor.TextColor,
    fontWeight: FontWeight.w300,
    fontSize: 20.sp,
    fontFamily: 'Onest',
  );
  static TextStyle buttonTextStyle = TextStyle(
    color: AppColor.primaryColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Onest',
    fontSize: 16.sp,
  );

  static TextStyle hintStyle = TextStyle(
      color: AppColor.previewTextColor,
      fontFamily: 'Onest',
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0);
  static TextStyle headerTextStyle2 = TextStyle(
      letterSpacing: .5,
      color: AppColor.white,
      fontWeight: FontWeight.w700,
      fontFamily: 'Onest',
      fontSize: 28.sp);
}
