import 'package:flutter/material.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';
import 'package:legal_document_generator/components/constants/icons.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey,
      color: AppColors.peach2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: SizedBox(
            height: 40, width: 40, child: Image.asset(AppIcons.premiumIcon)),
        title: const Text('Buy Premium'),
      ),
    );
  }
}
