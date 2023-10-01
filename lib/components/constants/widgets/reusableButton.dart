
import 'package:flutter/material.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';


class ReusableButton extends StatelessWidget {
  const ReusableButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.function,
  });

  final Function()? function;
  final double height;
  final double width;
  final double fontSize;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(width, height), // Set the width and height as needed
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(30.0), // Set the radius as needed
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: AppColor.primaryColor, width: 2),
        ),
        backgroundColor: MaterialStatePropertyAll(AppColor.secondaryColor),
      ),
      onPressed: function,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w500,
            fontFamily: 'Onest',
            fontSize: fontSize),
      ),
    );
  }
}
