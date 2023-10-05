import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_authentication/widgets/widget.dart';
import 'package:legal_document_generator/components/constants/widgets/custom_button.dart';

import '../../components/constants/app_colors.dart';

class PreviewDocument extends StatelessWidget {
  const PreviewDocument({Key? key, required this.document}) : super(key: key);
  final String document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: Text(document, textAlign: TextAlign.start,))),
            const SizedBox(height: 10,),
            CustomButton(
              buttonText: 'Copy text to clipboard',
              onPressed: (){
                Clipboard.setData(ClipboardData(text: document)).then((_){
                  showSnackbar(context, AppColor.successfulSnackbarColor, 'Copied successfully');
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
