import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:legal_document_generator/components/constants/widgets/custom_button.dart';
import 'package:legal_document_generator/components/constants/widgets/custom_textfield.dart';
import 'package:legal_document_generator/presentation/router/base_navigator.dart';
import '../../components/constants/app_colors.dart';
import '../../data/api_implementation.dart';
import 'package:http/http.dart' as http;


class CreateDocument extends StatefulWidget {
  static const String routeName = "create-document-screen";
  const CreateDocument({Key? key}) : super(key: key);

  @override
  State<CreateDocument> createState() => _CreateDocumentState();
}

class _CreateDocumentState extends State<CreateDocument> {
  final documentTypeController = TextEditingController();
  final keyPointsController = TextEditingController();
  final String apiKey = dotenv.env['open_ai_key']!;
  late final Api api;
  late final openAI;

  void fetchData() async {
   try{
     String prompt = 'Create a ${documentTypeController.text} using the following key points: ${keyPointsController.text} and keep the chat res';
     final apiResponse = await api.postToCompletions(prompt);
     late String responseText;
     responseText = apiResponse.data['text'];
     print(responseText);
   }catch(e){

   }

    setState(() {

    });
  }
  String responseText = '';

  Future<void> postToCompletions() async {
    final messages = [
      {'role': 'system', 'content': 'You are a helpful assistant.'},
      {
        'role': 'user',
        'content': 'Create a ${documentTypeController.text} using the following key points: ${keyPointsController.text} and keep the chat restricted to the conversation. If you\'re asked anything beyond the scope of the topic, decline to answer.'
      },
    ];

    const url = 'https://api.openai.com/v1/chat/completions';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = {
      'messages': messages,
      'model': 'gpt-3.5-turbo',
      'max_tokens': 1024, // Customize this as needed
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final text = responseData['choices'][0]['message']['content'];
      print(response.body);
      return text;
    } else {
      print(response.body);
      print(response.statusCode);
    }
  }


  void fetchData2() async {
   try{
     const prompt = 'Generate a legal document for a contract between parties.';
     final http.Response response = await openAI.postToCompletions(prompt);
     print(response.statusCode);

     setState(() {
       responseText = response.body;
     });
   }catch(e){
     print('failed');
   }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    documentTypeController.dispose();
    keyPointsController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    api = Api(apiKey);
    openAI = OpenAI(apiKey);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.secondaryColor,
          leading: IconButton(
              onPressed: (){
                BaseNavigator.pop();
              },
              icon: Icon(Icons.arrow_back_outlined, color: AppColor.white,)),
          title: const Text(
            'Create New Document',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CustomTextField(
               label: 'Legal Document Type',
               controller: documentTypeController,
               hintText: 'Example: Employment Contract',
                onChanged: (value){},
             ),
            CustomTextField(
              controller: keyPointsController,
              label: 'Key Points',
              hintText: 'Example: Employer name is ABC & Employee name is JOHN DOE',
              onChanged: (value ) {  },
            ),
               Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      onPressed: (){
                        postToCompletions();
                      },
                      buttonText: 'Create Document',
                      backgroundColor: AppColor.secondaryColor,
                    )),
              )
            ],
          ),
        ));
  }
}
