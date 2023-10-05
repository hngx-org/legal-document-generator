
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';


class OpenAiContainer extends StatelessWidget {
  const OpenAiContainer({required this.input});
final String input;
  @override
  Widget build(BuildContext context) {
    return Container(
    width:double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.black),
        borderRadius: BorderRadius.circular(22), color: AppColor.backgroundColor3),
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 15, top: 8, bottom: 8).r,
      child: Text(
        input,
        textAlign: TextAlign.left,
        style: TextStyle(
            wordSpacing: -1,
            color: AppColor.secondaryColor,
            inherit: true,
            fontFamily: 'Onest',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp),
      ),
    ),
  );;
  }
}


