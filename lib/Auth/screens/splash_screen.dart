//import 'dart:js';

import 'package:flutter/material.dart';

import 'sign_up.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    decideNav();
    super.initState();
  }

  void decideNav() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context as BuildContext,
        MaterialPageRoute(
          builder: (context) => const SignUp(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 180.0),
        child: Center(
          child: Column(
            children: [Image.asset('assets/images/sub.jpg')],
          ),
        ),
      ),
    );
  }
}
