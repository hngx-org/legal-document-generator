import 'package:flutter/material.dart';
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
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        padding: MaterialStatePropertyAll(
          padding ?? const EdgeInsets.all(16),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
          ),
        ),
      ),
      child: buttonWidget ??
          Text(
            buttonText ?? "",
            style: CustomTextStyles.buttonTextStyle
          ),
    );
  }
}
