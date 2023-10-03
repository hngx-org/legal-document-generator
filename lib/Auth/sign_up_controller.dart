import 'package:http/http.dart' as http;
import 'dart:convert';
import 'sign_up_model.dart';

class UserController {
  Future<SignUpModel?> registerUser(
      String name, String email, String password) async {
    final apiUrl =
        'https://spitfire-interactions.onrender.com/api/auth/register';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'confirm_password': password,
      }),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      return SignUpModel.fromJson(responseData['data']);
    } else {
      return null;
    }
  }
}
