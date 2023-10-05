import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_document_generator/components/constants/text_styles.dart';
import '../app_colors.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
        this.validator,
        required this.hintText,
        required this.label,
        this.controller,
        this.icon,
        this.iconAction,
        this.prefixIcon,
        this.inputType = TextInputType.text,
        this.onChanged,
        this.validateMode = AutovalidateMode.disabled,
        this.obscureText = false,
        this.padding = 10,
        this.readOnly = false})
      : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String hintText;
  final TextInputType inputType;
  final Function(String)? onChanged;
  final bool readOnly;
  final VoidCallback? iconAction;
  final validator;
  final validateMode;
  final bool obscureText;
  final IconData? icon;
  final IconData? prefixIcon;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0).r,
            child: Text(
              label,
              style: TextStyle(color: AppColor.TextColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Onest',
                fontSize: 16.sp,),
            )),
          const SizedBox(height: 5),
          Container(
            // height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColor.backgroundColor3,
                border: Border.all(
                    color: AppColor.black.withOpacity(0.7)),
                boxShadow: [
                  BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.8),
                      blurRadius: 1,
                      offset: const Offset(1, 2))
                ]),
            child: TextFormField(
              maxLines: obscureText ? 1 : 10,
              minLines: 1,
              obscuringCharacter: '*',
              autovalidateMode: validateMode,
              validator: validator,
              controller: controller,
              keyboardType: inputType,
              readOnly: readOnly,
              obscureText: obscureText,
              style: const TextStyle(
                letterSpacing: 2,
                color: const Color(0XFFEFA985),
                fontWeight: FontWeight.w500,
            fontFamily: 'Onest',
            fontSize: 16,
              ),
              decoration: InputDecoration(
                  prefixIcon: prefixIcon != null ? Icon(
                    prefixIcon,
                    color: AppColor.primaryColor
                  ) : null,
                  suffixIcon: GestureDetector(
                      onTap: iconAction,
                      child: Icon(
                        icon,
                        color:AppColor.black,
                      )),
                  hintText: hintText,
                  hintStyle: CustomTextStyles.hintStyle,
                  border: myBorder(),
                  focusedBorder: myBorder(),
                  enabledBorder: myBorder()),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder myBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15));
  }
}