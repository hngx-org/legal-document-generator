import 'package:flutter/material.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';
import 'package:legal_document_generator/components/constants/text_styles.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final Color? buttonTextColor;
  final Color? backgroundColor;
  final double? fontSize;
  final EdgeInsets? padding;
  final double? radius;
  final Widget? buttonWidget;
  final bool loading;

  const CustomButton({
    super.key,
    this.onPressed,
    this.buttonText,
    this.buttonTextColor,
    this.backgroundColor,
    this.fontSize,
    this.padding,
    this.radius,
    this.buttonWidget,
    this.loading = false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: !loading
            ? onPressed
            : null,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColor.secondaryColor),
          padding: MaterialStatePropertyAll(
            padding ?? const EdgeInsets.all(16),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
            ),
          ),
        ),
        child: !loading
            ? Text(
              buttonText ?? "",
              style: CustomTextStyles.buttonTextStyle
            )
            :  SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppColor.white),
        ),
            )
      ),
    );
  }
}
