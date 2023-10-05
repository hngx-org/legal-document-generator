// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:hng_authentication/widgets/widget.dart';
import 'package:legal_document_generator/components/constants/text_styles.dart';
import 'package:legal_document_generator/components/constants/widgets/custom_button.dart';
import 'package:legal_document_generator/components/constants/widgets/custom_textfield.dart';
import 'package:legal_document_generator/presentation/auth/screens/register.dart';
import 'package:legal_document_generator/presentation/home_screen/home_screen.dart';
import 'package:legal_document_generator/presentation/router/base_navigator.dart';
import '../../../components/constants/app_colors.dart';


class SignIn extends StatefulWidget {
  static const String routeName = 'Sign-in';

  const SignIn({
    super.key,
  });

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscurePassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            top: 20,
            bottom: 0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "LegalDocGen",
                    style:TextStyle(
                          color: AppColor.secondaryColor,
                          fontFamily: 'Onest',
                          fontWeight: FontWeight.w800,
                          fontSize: 36.sp,
                        ),
                  ),
                ),  const SizedBox(
                  height: 30,
                ),
              
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    "Login to your Account",
                    style: CustomTextStyles.headerTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                
                CustomTextField(
                  hintText: "someone@example.com",
                  controller: emailController,
                  label: 'Email Address',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  obscureText: _obscurePassword,
                  hintText: "Abc123#",
                  controller: passwordController,
                  icon: _obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  iconAction: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  label: 'Password',
                ),
                const SizedBox(
                  height: 40,
                ),
               
                CustomButton(
                  loading: isLoading,
                  onPressed: () async {
                    if(emailController.text.isEmpty){
                      showSnackbar(context, Colors.red, 'Please enter your email');
                    }else if(passwordController.text.isEmpty){
                      showSnackbar(context, Colors.red, 'Please enter your password');
                    }else{
                      setState(() {
                        isLoading = true;
                      });
                      final email = emailController.text;
                      final password = passwordController.text;
                      final authRepository = Authentication();
                      final currentContext = context;
                      try{
                        final data = await authRepository.signIn(email, password);

                        if (data != null) {
                          if (!context.mounted) return;
                          showSnackbar(currentContext, Colors.black, 'SignIn successful');
                          BaseNavigator.pushNamed(HomeScreen.routeName);
                        } else {
                          if (!context.mounted) return;
                          showSnackbar(currentContext, Colors.red, 'SignIn ERROR');
                        }
                      }catch(e){
                        print(e);
                        setState(() {
                          isLoading = false;
                        });
                        if (!context.mounted) return;
                        showSnackbar(currentContext, Colors.red, 'Error occurred');
                        BaseNavigator.pushNamed(HomeScreen.routeName);
                      }
                    }

                  },
                  buttonText: 'Sign In',
                ),
                IconButton(
                  onPressed: (){
                    BaseNavigator.pushNamed(RegistrationForm.routeName);
                  },
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? Sign up',
                        style: TextStyle(
                          color: AppColor.TextColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Onest',
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: AppColor.TextColor,
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


