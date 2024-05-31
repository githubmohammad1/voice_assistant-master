

// import 'package:shared_preferences/shared_preferences.dart';

class ChatUsers{
  String name;

  int chat_id;

  String time;
  ChatUsers({required this.name,required this.time,required this.chat_id,});
}


class ConversationList{
  String question;
  String answer;
  // ignore: non_constant_identifier_names
  int chat_id;
  String username;


  

  // ignore: non_constant_identifier_names
  ConversationList({required this.question,required this.answer,required this.chat_id,required this.username});
 }




 class Conversation {
  // final int chatId;
  final String question;
  final String answer;

  const Conversation({
    // required this.chatId,
    required this.question,
    required this.answer,
  });
 }
 