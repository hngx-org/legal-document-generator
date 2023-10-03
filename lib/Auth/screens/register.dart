import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:hng_authentication/widgets/rounded_bordered_textfield.dart';
import 'package:hng_authentication/widgets/widget.dart';

class RegistrationForm extends StatefulWidget {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final String successRoutePage;
  String btnText;
  Color btnColor;

  RegistrationForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.successRoutePage,
    this.btnText = 'Submit', // Provide a default button text
    this.btnColor =
        Colors.green, // Allow the button color to be null (optional)
  });

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
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
                  "Create Account",
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
                RoundedBorderedTextField(
                  hintText: "Username",
                  controller: widget.nameController,
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
                RoundedBorderedTextField(
                  hintText: "Confirm Password",
                  obscureText: _obscurePassword,
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return 'Please enter your password';
                    } else if ((val?.length ?? 0) < 6) {
                      return 'Password is not up to 6 characters';
                    } else if (((val?.length ?? 0) >= 6) &&
                        ((val ?? "") != widget.passwordController.text)) {
                      return "Password texts don't match";
                    } else {
                      return null;
                    }
                  },
                  // controller: widget.passwordController,
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
                      final name = widget.nameController.text;
                      final authRepository = Authentication();
                      final data =
                          await authRepository.signUp(email, name, password);

                      if (data != null) {
                        // Registration failed, display an error message

                        showSnackbar(
                            context, Colors.black, 'SignUp successful');
                        print('sign up Email >>> ${data.email}');
                        print('sign up id >>> ${data.id}');
                        print('sign up created at >>> ${data.createdAt}');
                        Navigator.of(context)
                            .pushNamed(widget.successRoutePage);
                      } else {
                        print('errror:   eeeeeee');
                        showSnackbar(context, Colors.red, 'SignUp ERROR');
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
