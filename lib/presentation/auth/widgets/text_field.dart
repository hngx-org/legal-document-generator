import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final initialValue;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 56,
      // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        style: const TextStyle(fontSize: 14),
        controller: controller,
        obscureText: obscureText,
        initialValue: initialValue,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
