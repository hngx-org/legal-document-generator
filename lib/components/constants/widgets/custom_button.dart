import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';
import 'package:legal_document_generator/components/constants/text_styles.dart';
import 'package:legal_document_generator/components/constants/widgets/reusableButton.dart';

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

  const CustomButton(
      {super.key,
      this.onPressed,
      this.buttonText,
      this.buttonTextColor,
      this.backgroundColor,
      this.fontSize,
      this.padding,
      this.radius,
      this.buttonWidget,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: !loading ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColor.secondaryColor),
          padding: MaterialStatePropertyAll(
            padding ?? const EdgeInsets.all(16),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: AppColor.primaryColor, width: 2),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 22),
            ),
          ),
        ),
        child: !loading
            ? Text(
                textAlign: TextAlign.center,
                buttonText ?? "",
                style: CustomTextStyles.buttonTextStyle)
            : SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColor.white),
                ),
              ),
      ),
    );
  }
}


// class ReusableButton extends StatelessWidget {
//   const ReusableButton({
//     super.key,
//     required this.text,
//     required this.height,
//     required this.width,
//     required this.fontSize,
//     required this.onClicked,
//   });

//   final Function()? onClicked;
//   final double height;
//   final double width;
//   final double fontSize;
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       style: ButtonStyle(
//         minimumSize: MaterialStateProperty.all<Size>(
//           Size(width, height), // Set the width and height as needed
//         ),
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           RoundedRectangleBorder(
//             borderRadius:
//                 BorderRadius.circular(30.0), // Set the radius as needed
//           ),
//         ),
//         side: MaterialStateProperty.all<BorderSide>(
//           BorderSide(color: AppColor.primaryColor, width: 2),
//         ),
//         backgroundColor: MaterialStatePropertyAll(AppColor.secondaryColor),
//       ),
//       onPressed: onClicked,
//       child: Text(
//         text,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             color: AppColor.primaryColor,
//             fontWeight: FontWeight.w500,
//             fontFamily: 'Onest',
//             fontSize: fontSize),
//       ),
//     );
//   }
// }


// class CustomButton extends StatelessWidget {
//   final Function()? onPressed;
//   final String? buttonText;
//   final Color? buttonTextColor;
//   final double? fontSize;
//   final bool loading;

//   const CustomButton({
//     super.key,
//     this.onPressed,
//     this.buttonText,
//     this.buttonTextColor,
//     this.fontSize,
//     this.loading = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           ReusableButton(
//             text: buttonText ?? "",
//             height: 50.h, // Set the height as needed
//             width: double.infinity, // Set the width as needed
//             fontSize: fontSize ?? 16, // Set the fontSize as needed
//             onClicked: !loading ? onPressed : null,
//           ),
//           if (loading)
//             Positioned.fill(
//               child: Center(
//                 child: SizedBox(
//                   height: 20,
//                   width: 20,
//                   child: CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation(AppColor.white),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }