import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';
import 'package:legal_document_generator/components/constants/widgets/reusableButton.dart';
import 'package:legal_document_generator/presentation/pdf_screen/pdf_Screen.dart';
import 'package:legal_document_generator/presentation/router/base_navigator.dart';

class NavToPdf extends StatelessWidget {
  static const String routeName = "btn-screen";
  const NavToPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: ReusableButton(
            text: 'Convert to Pdf',
            height: 5.h,
            width: 200.w,
            fontSize: 16.sp,
            onClicked: () async {
              final pdfFile =
                  await Pdf_Api.generateCenteredText('Legal Document');

              Pdf_Api.openFile(pdfFile);
          
            }),
      ),
    );
  }
}
