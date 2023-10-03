import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_document_generator/components/constants/widgets/reusableButton.dart';

class navToPdf extends StatelessWidget {
  const navToPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableButton(
        text: 'Convert to Pdf',
        height: 50.h,
        width: double.infinity,
        fontSize: 14.sp,
        function: () {});
  }
}
