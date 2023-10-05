

import 'package:hngx_openai/repository/openai_repository.dart';
import 'package:legal_document_generator/data/user_data.dart';

class ApiImplementation {
  static Future<List> getResponse(String userInput)async{
    bool success = false;
    String response = 'Hi, how can I help you today?';
    String cookie = UserData.userData['cookie'];
    OpenAIRepository openAI = OpenAIRepository();
    try{
      response = await openAI.getChat(userInput, cookie);
      success = true;
    }catch(e){
      response = 'Please try again, an error occurred';
    }
    return [response, success];

  }
  static Future<String> getCompletions(List<String> history,String userInput )async{
    String response = 'Hi, how can I help you today?';
    String cookie = UserData.userData['cookie'];
    OpenAIRepository openAI = OpenAIRepository();
    try{
      response = await openAI.getChatCompletions(history, userInput, cookie);
    }catch(e){
      response = 'Please try again, an error occurred';
    }
    return response;

  }

}

