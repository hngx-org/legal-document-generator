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

  void fetchData2() async {
    final prompt = 'Generate a legal document for a contract between parties.';
    final http.Response response = await openAI.postToCompletions(prompt);
    print(response.body);

    setState(() {
      responseText = response.body;
    });
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
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.deepPeach,
          leading: IconButton(
              onPressed: (){
                BaseNavigator.pop();
              },
              icon: Icon(Icons.arrow_back_outlined, color: AppColors.white,)),
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
                        fetchData2();
                      },
                      buttonText: 'Create Document',
                      backgroundColor: AppColors.deepPeach,
                    )),
              )
            ],
          ),
        ));
  }
}
