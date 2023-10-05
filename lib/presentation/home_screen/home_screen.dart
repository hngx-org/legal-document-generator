import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';
import 'package:legal_document_generator/components/constants/icons.dart';
import 'package:legal_document_generator/components/constants/text_styles.dart';
import 'package:legal_document_generator/presentation/auth/screens/sign_in.dart';
import 'package:legal_document_generator/presentation/home_screen/widgets/document_card.dart';
import 'package:legal_document_generator/presentation/home_screen/widgets/premium_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../create_document/create_document_screen.dart';
import '../router/base_navigator.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool empty = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
            iconTheme: IconThemeData(color: AppColor.primaryColor),
            backgroundColor: AppColor.secondaryColor,
            title: const Text(
              'LegalDocGen',
              style: TextStyle(
                color: Color(0XFF4D426D),
                fontWeight: FontWeight.w700,
                fontFamily: 'Onest',
                fontSize: 22,
              ),
            ),
            leading: const Icon(Icons.menu),
            actions: [
              IconButton(
                  onPressed: ()async{
                    final Future<SharedPreferences> preferences = SharedPreferences.getInstance();
                    final SharedPreferences prefs = await preferences;
                    await prefs.remove('loggedIn');
                    BaseNavigator.pushNamed(SignIn.routeName);
                  },
                  icon: const Icon(Icons.logout)
              )
            ],
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
              color: AppColor.primaryColor,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                    children: [
                      const PremiumCard(),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Pick Document Type',
                              style: CustomTextStyles.headerTextStyle,
                            ),)),
                      const SizedBox(
                        height: 10,
                      ),
                      DocumentCard(
                        color: AppColor.peach,
                        title: 'Generate an Employment Contract',
                        icon: AppIcons.legalDocIcon,
                      ),
                      DocumentCard(
                        color: AppColor.darkBlue1,
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
                      ),
                      DocumentCard(
                        color: AppColor.peach,
                        title: 'Generate a Sworn Affidavit',
                        icon: AppIcons.legalDocIcon,
                      ),
                    ],
                  ),
          )),
    );
  }
}
