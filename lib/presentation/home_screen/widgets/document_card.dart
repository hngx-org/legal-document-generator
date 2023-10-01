import 'package:flutter/material.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';

class DocumentCard extends StatelessWidget {
  final Color color;
  final String icon;
  final String title;
  const DocumentCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      child: ListTile(
        leading: Container(
          height: 40,
            width: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: color
            ),
            child: Image.asset(icon, fit: BoxFit.fitHeight, color: AppColors.white,),),
        title: Text(title),
      ),
    );
  }
}