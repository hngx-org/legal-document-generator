// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;
  bool emailCorrectlyFormatted = false;

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
              top: 20,
              bottom: 0,
            ).r,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
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
                  ),
                  const SizedBox(
                    height: 30,
                  ), Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      "Create your Account",
                      style: CustomTextStyles.headerTextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
                    controller: confirmPasswordController,
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
                    label: 'Confirm Password',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    loading: isLoading,
                    onPressed: () async {
                      final email = emailController.text.toLowerCase().trim();
                      final password = passwordController.text;
                      final name = nameController.text;
                      validateEmail(emailController.text.trim().toLowerCase());
                      if(password.length < 8){
                        showSnackbar(context, AppColor.failedSnackbarColor, 'Password must be minimum of 8 characters');
                      }else if(name.contains(' ')){
                        showSnackbar(context, AppColor.failedSnackbarColor, 'Name cannot include spaces.');
                      }else if(!emailCorrectlyFormatted){
                        showSnackbar(context, AppColor.failedSnackbarColor, 'Email looks incorrect. Please check it and retry');
                      }else if(password != confirmPasswordController.text){
                        showSnackbar(context, AppColor.failedSnackbarColor, 'Passwords don\'t match');
                      } else{
                        setState(() {
                          isLoading = true;
                        });
                        final authRepository = Authentication();
                        try{
                          final data = await authRepository.signUp(email, name, password);

                          if (data != null) {
                            // Registration failed, display an error message
                            if(!context.mounted) return;
                            showSnackbar(
                                context, AppColor.successfulSnackbarColor, 'SignUp successful');
                            if(kDebugMode){
                              print('sign up Email >>> ${data.email}');
                              print('sign up id >>> ${data.id}');
                              print('sign up created at >>> ${data.createdAt}');
                            }
                            BaseNavigator.pushNamed(SignIn.routeName);
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            if(!context.mounted) return;
                            showSnackbar(context, AppColor.failedSnackbarColor, 'SignUp ERROR');
                          }
                        }catch(e){
                          setState(() {
                            isLoading = false;
                          });
                          if(!context.mounted) return;
                          showSnackbar(context, AppColor.failedSnackbarColor, 'SignUp ERROR');
                        }
                      }


                    },
                    buttonText: 'Sign Up',
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
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Onest',
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: AppColor.textColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void validateEmail(String value) {
    if (value.isEmpty) {
      emailCorrectlyFormatted = false;
    }

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex
        .hasMatch(value.trim().toLowerCase())) {
      emailCorrectlyFormatted = false;
      WidgetsBinding.instance.addPostFrameCallback((_){
        setState(() {});
      });
    }

    if (regex
        .hasMatch(value.trim().toLowerCase())) {
      emailCorrectlyFormatted = true;
      WidgetsBinding.instance.addPostFrameCallback((_){
        setState(() {});
      });
    }
  }
}
