import 'package:flutter/material.dart';
import 'package:legal_document_generator/Auth/sign_up_model.dart';
import 'package:hng_authentication/authentication.dart';

import '../sign_up_controller.dart';
import 'sign_in.dart';

final UserController userController = UserController();

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final firstNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isVisible = false;

  Future<void> _handleSignUp() async {
    final name = firstNameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirm_password = confirmPasswordController.text;

    final SignUpModel? user =
        await userController.registerUser(name, email, password);

    if (user != null) {
      // Registration successful
      print('Registration successful');
      print('User ID: ${user.id}');
    } else {
      // Registration failed
      print('Registration failed');
      // Display an error message to the user.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 180,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/login.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              // Container(
              //   width: 382,
              //   height: 56,
              //   decoration: ShapeDecoration(
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(width: 1),
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //   ),
              //   child: TextFormField(
              //     controller: firstNameController,
              //     style: const TextStyle(color: Colors.black),
              //     cursorColor: Colors.black,
              //     keyboardType: TextInputType.emailAddress,
              //     decoration: InputDecoration(
              //       prefixIcon: const Icon(
              //         Icons.person_outline_rounded,
              //         color: Colors.grey,
              //       ),
              //       labelText: "Name",
              //       labelStyle: TextStyle(color: Colors.black),
              //       filled: true,
              //       focusedBorder: InputBorder.none,
              //       enabledBorder: InputBorder.none,
              //       fillColor: Colors.white,
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 382,
                height: 56,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail_outline_rounded,
                        color: Color(0xffb1b1b4)),
                    labelText: "Email Address",
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                width: 382,
                height: 56,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextFormField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  obscureText: _isVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline_rounded,
                        color: Color(0xffb1b1b4)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: Icon(
                            _isVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xffb1b1b4))),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 382,
                height: 56,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextFormField(
                  controller: confirmPasswordController,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  obscureText: _isVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline_rounded,
                        color: Color(0xffb1b1b4)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: Icon(
                            _isVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xffb1b1b4))),
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: _handleSignUp, // Call the registration function on tap
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const SignIn()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
