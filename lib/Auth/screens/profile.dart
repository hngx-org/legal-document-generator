// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hng_authentication/authentication.dart';
// import 'package:hng_authentication/src/models/user.dart';
// import 'package:hng_authentication/widgets/widget.dart';

// class ProfileScreen extends StatefulWidget {
// final String successRoutePage;
//   String btnText;
//   Color btnColor;


//    ProfileScreen({super.key, required this.successRoutePage,
//     this.btnText = 'Submit', // Provide a default button text
//     this.btnColor =
//         Colors.green,});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   User? userData; // Store the user data

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final authRepository = Authentication();
//       final user = await authRepository.getUser();
//       setState(() {
//         userData = user;
//       });
//     } catch (e) {
//       // Handle errors
//       print('Error fetching user data: $e');
//     }
//   }

//    Future<void> handleLogout() async {
//     try {
//       final authRepository = Authentication();
//       final data = await authRepository.logout(email);

//       if (data != null) {
//         // Logout successful
//         showSnackbar(context, Colors.black, 'LogOut Successfully');
//         // Perform any additional actions after logout if needed
//       } else {
//         // Logout failed
//         showSnackbar(context, Colors.red, 'Logout Error');
//       }
//     } catch (e) {
//       // Handle logout errors
//       print('Error during logout: $e');
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               color: Colors.brown,
//               child: Column(
//                 children: [
//                   Text('Username: ${userData?.name ?? 'Loading...'}'),
//                   Text('Email: ${userData?.email ?? 'Loading...'}'),
//                   Text('ID: ${userData?.id ?? 'Loading...'}'),
//                 ],
//               ),
//             ),

//             SizedBox(height: 50,),


//              SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                         widget.btnColor,
//                       ),
//                     ),
//                     onPressed: handleLogout,
//                     child: Text(
//                       widget.btnText,
//                       style: GoogleFonts.lato(
//                         textStyle: const TextStyle(
//                           letterSpacing: .16,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//           ],
//         ),
//       ),
//     );
//   }
// }
