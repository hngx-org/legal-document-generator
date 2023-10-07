import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';
import 'package:legal_document_generator/data/user_data.dart';
import 'package:legal_document_generator/presentation/auth/screens/sign_in.dart';
import 'package:legal_document_generator/presentation/home_screen/home_screen.dart';
import 'package:legal_document_generator/presentation/onBoarding_screen/onBoarding_screen.dart';
import 'package:legal_document_generator/presentation/router/base_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  late bool userLoggedIn = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void>loadPrefs()async{


  }
  @override
  void initState() {
    super.initState();
    loadPrefs();
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
        Future.delayed(const Duration(milliseconds: 1000), () async{
          final SharedPreferences prefs = await _prefs;
          if(prefs.containsKey('loggedIn')){
            String encodedUserData = prefs.getString('userData')!;
            UserData.userData = json.decode(encodedUserData);
            BaseNavigator.pushNamed(HomeScreen.routeName);
          }else if(prefs.containsKey('userData')){
            BaseNavigator.pushNamed(SignIn.routeName);
          }else{
            BaseNavigator.pushNamed(OnBoardingScreen.routeName);
          }

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
                      ),
                    ],
                  ),
                  SpinKitSpinningLines(
                    color: textColorAnimation.value,
                    size: 30.r,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 14).r,
                child: Text(
                  'Version:- 1.0.0',
                  style: TextStyle(
                    color: textColorAnimation.value,
                    fontFamily: 'Onest',
                    fontWeight: FontWeight.w800,
                    fontSize: 12.sp,
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
