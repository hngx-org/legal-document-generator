import 'package:flutter/material.dart';
import 'package:legal_document_generator/components/constants/widgets/reusableButton.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../components/constants/app_colors.dart';


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
                height: 40.h,
              ),
              SizedBox(
                child: Column(
                  children: [
                    Text(
                      firstText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.TextColor,
                          fontFamily: 'Onest',
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 25).r,
                      child: Text(
                        textAlign: TextAlign.center,
                        secondText,
                        style: TextStyle(
                            color: AppColor.TextColor,
                            fontFamily: 'Onest',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: lottieHeight,
                width: lottieWidth,
                child: Lottie.asset(
                  animation,
                ),
              ),
              SizedBox(height: 15.h),
              ReusableButton(
                text: onLastPage ? 'Get Started' : 'Continue',
                height: 50.h,
                width: 200.w,
                fontSize: 16.sp,
                function: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              ),
            ],
          ),
        ));
  }
}
