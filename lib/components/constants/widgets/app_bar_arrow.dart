import 'package:flutter/material.dart';

class AppBarArrow extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  final Widget child;

  const AppBarArrow({
    super.key,
    this.onTap,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStatePropertyAll(color ?? Colors.transparent),
      child: child,
    );
  }
}
