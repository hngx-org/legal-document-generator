import 'package:flutter/material.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';
import 'package:legal_document_generator/components/constants/icons.dart';
import 'package:legal_document_generator/presentation/router/base_navigator.dart';
import 'package:legal_document_generator/presentation/subscription/subscription.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: AppColor.backgroundColor2,
      color: AppColor.peach2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: SizedBox(
            height: 40, width: 40, child: Image.asset(AppIcons.premiumIcon)),
        title: const Text(
          'Buy Premium',
          style: TextStyle(
            // color: AppColor.TextColor,
            fontWeight: FontWeight.w400,
            fontFamily: 'Onest',
            fontSize: 16,
          ),
        ),
        onTap: (){
          BaseNavigator.pushNamed(Subscription_screen.routeName);
        },
      ),
    );
  }
}
