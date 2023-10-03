import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:hng_authentication/widgets/rounded_bordered_textfield.dart';
import 'package:hng_authentication/widgets/widget.dart';

class SignIn extends StatefulWidget {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final String successRoutePage;
  String btnText;
  Color btnColor;

  SignIn({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.successRoutePage,
    this.btnText = 'Sign In', // Provide a default button text
    this.btnColor = Colors.green,
  });

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
                  "Sign In",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      letterSpacing: .5,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundedBorderedTextField(
                  hintText: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                  controller: widget.emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundedBorderedTextField(
                  hintText: "Enter Password",
                  obscureText: _obscurePassword,
                  controller: widget.passwordController,
                  isPass: true,
                  icon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: const Color.fromRGBO(115, 106, 185, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        widget.btnColor,
                      ),
                    ),
                    onPressed: () async {
                      final email = (widget.emailController).text;
                      final password = (widget.passwordController).text;

                      final authRepository = Authentication();
                      final data = await authRepository.signIn(email, password);

                      if (data != null) {
                        // Registration failed, display an error message

                        showSnackbar(
                            context, Colors.black, 'SignIn successful');
                        print('Email>>> ${data.email}');
                        print('id >>> ${data.id}');
                        print('Name>>> ${data.name}');

                        Navigator.of(context)
                            .pushNamed(widget.successRoutePage);
                      } else {
                        print('errror:   eeeeeee');
                        showSnackbar(context, Colors.red, 'SignIn ERROR');
                      }
                    },
                    child: Text(
                      widget.btnText,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          letterSpacing: .16,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
