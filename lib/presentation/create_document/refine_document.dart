// ignore_for_file: unnecessary_string_interpolations

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:legal_document_generator/data/api_implementation.dart';
import 'package:legal_document_generator/presentation/create_document/preview_doc.dart';
import 'package:legal_document_generator/presentation/create_document/widgets/chat_response.dart';
import 'package:legal_document_generator/presentation/pdf_screen/pdf_Screen.dart';
import '../../components/constants/app_colors.dart';
import '../../components/constants/widgets/custom_textfield.dart';
import '../router/base_navigator.dart';


class RefineDocument extends StatefulWidget {
  const RefineDocument({Key? key, required this.rawInput, required this.documentType, required this.generatedText, required this.keyPoints}) : super(key: key);

  final String documentType;
  final String generatedText;
  final String keyPoints;
  final String rawInput;

  @override
  State<RefineDocument> createState() => _RefineDocumentState();
}

class _RefineDocumentState extends State<RefineDocument> {

  List<Widget>messages = [];
  List<String> history = [];
  final controller = TextEditingController();
  String userInput = '';
  late String finalOutput;

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finalOutput = widget.generatedText;
    history.add(widget.rawInput);
    messages = [
      ChatResponse(
          content: 'I need help creating a/an ${widget.documentType}, using the following keypoints: ${widget.keyPoints}'
      ),
      ChatResponse(
        content: widget.generatedText,
        isUser: false,
      ),
    ];
  }

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
          'Refine Document',
          style: TextStyle(
            color: Color(0XFF4D426D),
            fontWeight: FontWeight.w700,
            fontFamily: 'Onest',
            fontSize: 22,
          ),
        ),
        actions: [
          TextButton(
            onPressed: Platform.isIOS
                ? () async {
                    final pdfFile = await Pdf_Api.generateCenteredText(
                        documentBody: '${widget.keyPoints}',
                        documentHeader: '${widget.documentType}');

                    Pdf_Api.openFile(pdfFile);
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Navigator.pop(context);
                    });
                  }
                : Platform.isAndroid
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PreviewDocument(document: finalOutput),
                          ),
                        );
                      }
                    : null,
            child: Platform.isIOS
                ? const Text(
                    'Convert to PDF',
                    style: TextStyle(
                        color: Color.fromARGB(255, 116, 77, 123), fontSize: 14),
                  )
                : Platform.isAndroid
                    ? const Text(
                        'Preview Document',
                        style: TextStyle(
                            color: Color.fromARGB(255, 116, 77, 123),
                            fontSize: 14),
                      )
                    : Text(''),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: messages,
                ),
              ),
            ),
            CustomTextField(
              controller: controller,
              hintText: 'Message',
              label: '',
              icon: Icons.send,
              iconAction: () async {
                userInput = controller.text;
                controller.text = '';
                setState(() {
                  messages.add(
                    ChatResponse(content: userInput),
                  );
                });
                final response = await ApiImplementation.getCompletions(
                  history,
                  userInput,
                );
                finalOutput = response;
                messages.add(
                  ChatResponse(isUser: false, content: response),
                );
                history.add(userInput);
                setState(() {});
              },
            ),  SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}


