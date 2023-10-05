import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng_authentication/widgets/widget.dart';
import 'package:legal_document_generator/components/constants/widgets/custom_button.dart';
import 'package:legal_document_generator/components/constants/widgets/custom_textfield.dart';
import 'package:legal_document_generator/data/api_implementation.dart';
import 'package:legal_document_generator/presentation/create_document/refine_document.dart';
import 'package:legal_document_generator/presentation/router/base_navigator.dart';
import '../../components/constants/app_colors.dart';

class CreateDocument extends StatefulWidget {
  static const String routeName = "create-document-screen";
  const CreateDocument({Key? key, this.documentType}) : super(key: key);

  final String? documentType;

  @override
  State<CreateDocument> createState() => _CreateDocumentState();
}

class _CreateDocumentState extends State<CreateDocument> {
  TextEditingController documentTypeController = TextEditingController();
  final keyPointsController = TextEditingController();
  final String apiKey = dotenv.env['open_ai_key']!;
  bool isLoading = false;

  String responseText = '';

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
   documentTypeController = TextEditingController(text: widget.documentType ?? '');
  }

  bool isVisible = false;
  bool isGenerated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
        leading: IconButton(
            onPressed: () {
              BaseNavigator.pop();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: AppColor.iconColors,
            )),
        title: const Text(
          'Create New Document',
          style: TextStyle(
            color: Color(0XFF4D426D),
            fontWeight: FontWeight.w700,
            fontFamily: 'Onest',
            fontSize: 22,
          ),
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
              onChanged: (value) {},
            ),
            CustomTextField(
              controller: keyPointsController,
              label: 'Key Points',
              hintText:
                  'Example: Employer name is ABC & Employee name is JOHN DOE',
              onChanged: (value) {},
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    loading: isLoading,
                      onPressed: () async {
                      if(documentTypeController.text.isEmpty){
                        showSnackbar(context, AppColor.failedSnackbarColor, 'Please enter a document type');
                      }else if(keyPointsController.text.isEmpty){
                        showSnackbar(context, AppColor.failedSnackbarColor, 'Please enter key points to note for document generation');
                      }else{
                        setState(() {
                          isLoading = true;
                        });
                        String input = 'Create a ${documentTypeController.text} using the following key points: ${keyPointsController.text} and limit the scope of this conversation to the creation of this document';
                        List response = await ApiImplementation.getResponse(input);
                        if(response[1]){
                          setState(() {
                            isLoading = false;
                          });
                          if(!mounted) return;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RefineDocument(rawInput: input, keyPoints: keyPointsController.text, documentType: documentTypeController.text, generatedText: response[0])));
                        }

                      }
                      },
                    buttonText: 'Create Document',
                    backgroundColor: AppColor.secondaryColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
                  
