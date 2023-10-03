import 'package:flutter/material.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';
import 'package:legal_document_generator/presentation/onBoarding_screen/widgets/introPage.dart';


import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = 'onboarding-Screen';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            scrollDirection: Axis.horizontal,
            children: [
              IntroPage(
                controller: _controller,
                firstText: 'Simplify Legal Document Management',
                secondText:
                    'Unlock the power of efficient legal document handling with LegalDocGen. Our platform revolutionizes the way you manage legal documents, making it easy, precise, and timely.',
                animation: 'assets/animations/animation_ln50a4pa.json',
                lottieHeight: 300.h,
                lottieWidth: double.infinity,
                backgroundColor: AppColor.backgroundColor,
                onLastPage: onLastPage,
              ),
              IntroPage(
                controller: _controller,
                firstText: 'Effortless Document Creation',
                secondText:
                    'Crafting legally sound documents has never been this simple. LegalDocGen guides you through the process, ensuring accuracy while minimizing complexity. Create your documents with confidence.',
                animation: 'assets/animations/animation_ln4zz6u3.json',
                lottieHeight: 300.h,
                lottieWidth: double.infinity,
                backgroundColor: AppColor.primaryColor,
                onLastPage: onLastPage,
              ),
              IntroPage(
                controller: _controller,
                firstText: 'Timely Document Generation',
                secondText:
                    'Need a document promptly? LegalDocGen delivers. Say goodbye to lengthy document creation processes. Generate documents on-demand and stay ahead of your legal requirements.',
                animation: 'assets/animations/animation_ln57bdpd.json',
                lottieHeight: 300.h,
                lottieWidth: double.infinity,
                backgroundColor: AppColor.backgroundColor2,
                onLastPage: onLastPage,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 50).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotHeight: 5.h,
                      dotWidth: 8.w,
                      dotColor: AppColor.TextColor,
                      activeDotColor: AppColor.secondaryColor,
                      spacing: 5.r),
                ),
                IconButton(
                  onPressed: (){ _controller.jumpToPage(2);},
                  icon: Row(
                    children: [
                      Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColor.TextColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Onest',
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: AppColor.TextColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
