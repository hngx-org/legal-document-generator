// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:hng_authentication/widgets/widget.dart';
import 'package:legal_document_generator/components/constants/text_styles.dart';
import 'package:legal_document_generator/components/constants/widgets/custom_button.dart';
import 'package:legal_document_generator/components/constants/widgets/custom_textfield.dart';
import 'package:legal_document_generator/presentation/auth/screens/sign_in.dart';
import 'package:legal_document_generator/presentation/router/base_navigator.dart';

import '../../../components/constants/app_colors.dart';

class RegistrationForm extends StatefulWidget {
  static const String routeName = 'Registration-screen';

  const RegistrationForm({
    super.key,
  });

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _obscurePassword = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
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
                Text(
                  "Create Account",
                  style: CustomTextStyles.headerTextStyle2,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "john_doe",
                  controller: nameController,
                  label: 'Username',
                ),
                 SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  hintText: "someone@example.com",
                  inputType: TextInputType.emailAddress,
                  controller: emailController,
                  label: 'Email Address',
                ),
                 SizedBox(
                  height: 20.h,
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
                  onChanged: (value) {},
                ),
                 SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  obscureText: _obscurePassword,
                  hintText: "Abc123#",
                  icon: _obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  iconAction: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return 'Please enter your password';
                    } else if ((val?.length ?? 0) < 6) {
                      return 'Password is not up to 6 characters';
                    } else if (((val?.length ?? 0) >= 6) &&
                        ((val ?? "") != passwordController.text)) {
                      return "Password texts don't match";
                    } else {
                      return null;
                    }
                  },
                  label: 'Confirm Password',
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  loading: isLoading,
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    final email = emailController.text.toLowerCase().trim();
                    final password = passwordController.text;
                    final name = nameController.text;
                    print(email);
                    print(password);
                    print(name);
                    final authRepository = Authentication();
                    try{
                      final data = await authRepository.signUp(email, name, password);

                      if (data != null) {
                        // Registration failed, display an error message
                        if(!context.mounted) return;
                        showSnackbar(
                            context, Colors.black, 'SignUp successful');
                        print('sign up Email >>> ${data.email}');
                        print('sign up id >>> ${data.id}');
                        print('sign up created at >>> ${data.createdAt}');
                        BaseNavigator.pushNamed(SignIn.routeName);
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                        if(!context.mounted) return;
                        showSnackbar(context, Colors.red, 'SignUp ERROR');
                      }
                    }catch(e){
                      print(e);
                      setState(() {
                        isLoading = false;
                      });
                      if(!context.mounted) return;
                      showSnackbar(context, Colors.red, 'SignUp ERROR');
                      BaseNavigator.pushNamed(SignIn.routeName);
                    }

                  },
                  buttonText: 'Create Account',
                ),
                IconButton(
                  onPressed: (){
                      BaseNavigator.pushNamed(SignIn.routeName);
                    },
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? Sign in',
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
