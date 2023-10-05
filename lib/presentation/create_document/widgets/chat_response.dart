import 'package:flutter/material.dart';

import '../../../components/constants/app_colors.dart';
import '../../../data/user_data.dart';

class ChatResponse extends StatelessWidget {
  const ChatResponse({Key? key, required this.content, this.isUser = true}) : super(key: key);

  final bool isUser;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.secondaryColor,
            ),
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Text( isUser
                  ? UserData.userData['name'].toString().toUpperCase()[0]
                  : 'AI'
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( isUser
                    ? UserData.userData['name'].toString().toUpperCase()
                    : 'LegalDocGen',
                  style: TextStyle(color: AppColor.secondaryColor, fontWeight: FontWeight.bold),

                ),
                Text(content, textAlign: TextAlign.left, style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}