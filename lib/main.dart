import 'package:flutter/material.dart';
import 'package:legal_document_generator/Auth/screens/register.dart';
import 'package:legal_document_generator/Auth/screens/sign_in.dart';
import 'package:legal_document_generator/Auth/screens/splash_screen.dart';
import 'package:legal_document_generator/Subscribtion/subscription.dart';

import 'Auth/screens/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Subscription(),
    );
  }
}

//  routes: {
//         '/': (context) => RegistrationForm(
//               emailController: emailController,
//               successRoutePage: '/home',
//               nameController: nameController,
//               passwordController: passwordController, // Use the route name here
//             ),
//         '/signup': (context) => const SignUp(),
//       },
//       initialRoute: '/',

      

      // SignIn(
      //         emailController: emailController,
      //         successRoutePage: '/home',
      //         passwordController: passwordController, // Use the route name here
      //       ),
      //   '/signup': (context) => const SignUp(),

