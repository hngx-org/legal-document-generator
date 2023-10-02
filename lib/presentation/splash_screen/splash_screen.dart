import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';
import 'package:legal_document_generator/presentation/onBoarding_screen/onBoarding_screen.dart';
import 'package:legal_document_generator/presentation/router/base_navigator.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation textColorAnimation;
  late Animation sizeAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    colorAnimation =
        ColorTween(begin: AppColor.secondaryColor, end: AppColor.primaryColor)
            .animate(controller);
    textColorAnimation =
        ColorTween(begin: AppColor.primaryColor, end: AppColor.secondaryColor)
            .animate(controller);
    sizeAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();

    controller.addListener(() {
      setState(() {});
      if (controller.isCompleted) {
        // Use Future.delayed to delay navigation until after the animation.
        Future.delayed(const Duration(milliseconds: 1000), () {
         BaseNavigator.pushNamed(OnBoardingScreen.routeName);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation.value,
      body: ScreenUtilInit(
        builder: (context, child){
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LegalDocGen',
                        style: TextStyle(
                          color: textColorAnimation.value,
                          fontFamily: 'Onest',
                          fontWeight: FontWeight.w800,
                          fontSize: 30.sp,
                        ),
                      ),
                      Icon(
                        Icons.edit_document,
                        color: textColorAnimation.value,
                        size: 33.r,
                      )
                    ],
                  ),
                  SpinKitSpinningLines(
                    color: textColorAnimation.value,
                    size: 30.r,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Version:- 1.0.0',
                  style: TextStyle(
                    color: textColorAnimation.value,
                    fontFamily: 'Onest',
                    fontWeight: FontWeight.w800,
                    fontSize: 10.sp,
                  ),
                ),
              )
            ],
          );
        },
        designSize: const Size(428, 926),
      )
    );
  }
}
