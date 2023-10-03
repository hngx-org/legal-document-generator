import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';
import 'package:legal_document_generator/components/constants/animations.dart';
import 'package:legal_document_generator/components/constants/icons.dart';
import 'package:legal_document_generator/components/constants/text_styles.dart';
import 'package:legal_document_generator/presentation/home_screen/widgets/document_card.dart';
import 'package:legal_document_generator/presentation/home_screen/widgets/premium_card.dart';
import 'package:lottie/lottie.dart';

import '../create_document/create_document_screen.dart';
import '../router/base_navigator.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool empty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.secondaryColor,
          title: const Text(
            'Legal Docs Generator',
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.secondaryColor,
          onPressed: () {
            BaseNavigator.pushNamed(
              CreateDocument.routeName,
            );
          },
          child: Icon(
            Icons.add,
            color: AppColor.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: empty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        height: 150.h,
                        width: 150.w,
                        child: Lottie.asset(AppAnimations.noHistory)),
                    Center(
                        child: Text(
                      'No document created. Tap the plus icon below to create a new document',
                      style: CustomTextStyles.normalWhiteText,
                    ))
                  ],
                )
              : Column(
                  children: [
                    const PremiumCard(),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pick Document Type',
                          style: CustomTextStyles.headerTextStyle,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    DocumentCard(
                      color: AppColor.peach,
                      title: 'Generate a Legal Contract',
                      icon: AppIcons.legalDocIcon,
                    ),
                    DocumentCard(
                      color: AppColor.purple,
                      title: 'Generate a Last Will & Testament',
                      icon: AppIcons.legalDocIcon,
                    ),
                    DocumentCard(
                      color: AppColor.brown,
                      title: 'Generate a Court Document',
                      icon: AppIcons.legalDocIcon,
                    ),
                    DocumentCard(
                      color: AppColor.green,
                      title: 'Generate a Corporate Document',
                      icon: AppIcons.legalDocIcon,
                    )
                  ],
                ),
        ));
  }
}
