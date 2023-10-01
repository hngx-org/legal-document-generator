import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Api {
  late Dio dio;

  Api(String apiKey) {
    dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $apiKey';
  }

  Future<Response> postToCompletions(String prompt) async {
    final response = await dio.post(
      'https://api.openai.com/v1/completions',
      data: {
        'prompt': prompt,
        'max_tokens': 10, // Customize this as needed
      },
    );

    return response;
  }
}
class OpenAI {
  final String apiKey;

  OpenAI(this.apiKey);

  Future<String> postToCompletions(String prompt) async {
    final url = 'https://api.openai.com/v1/completions';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = {
      'prompt': prompt,
      'max_tokens': 50, // Customize this as needed
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final text = responseData['choices'][0]['text'];
      return text;
    } else {
      throw Exception('Failed to post to Completions endpoint');
    }
  }
}

