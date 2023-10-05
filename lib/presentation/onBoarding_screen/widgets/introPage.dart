import 'package:flutter/material.dart';
import 'package:legal_document_generator/components/constants/widgets/reusableButton.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_document_generator/presentation/auth/screens/register.dart';
import 'package:legal_document_generator/presentation/home_screen/home_screen.dart';
import 'package:legal_document_generator/presentation/pdf_screen/nav_to_pdf_screen.dart';
import 'package:legal_document_generator/presentation/router/base_navigator.dart';
import 'package:lottie/lottie.dart';

import '../../../components/constants/app_colors.dart';
import '../../auth/screens/sign_in.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({
    super.key,
    required PageController controller,
    required this.firstText,
    required this.secondText,
    required this.animation,
    required this.lottieHeight,
    required this.lottieWidth,
    required this.backgroundColor,
    required this.onLastPage,
  }) : controller = controller;

  final PageController controller;
  final String firstText;
  final String secondText;
  final String animation;
  final double lottieHeight;
  final double lottieWidth;
  final Color backgroundColor;
  final bool onLastPage;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Column(
                children: [
                  SizedBox(width: 320.w,
                    child: Text(
                      firstText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.textColor,
                          fontFamily: 'Onest',
                          fontWeight: FontWeight.w700,
                          fontSize: 28.sp),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 17, right: 17, top: 25,).r,
                    child: Text(
                      textAlign: TextAlign.center,
                      secondText,
                      style: TextStyle(
                          color: AppColor.textColor,
                          fontFamily: 'Onest',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: lottieHeight,
                width: lottieWidth,
                child: Lottie.asset(
                  animation,
                ),
              ),
              SizedBox(height: 30.h),
              ReusableButton(
                text: onLastPage ? 'Get Started' : 'Continue',
                height: 50.h,
                  width: 180.w,
                  fontSize: 16.sp,
                onClicked: () {
                  onLastPage
                      ?  BaseNavigator.pushNamed(RegistrationForm.routeName)
                      : controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                },
              ),
            ],
          ),
        ));
  }
}
