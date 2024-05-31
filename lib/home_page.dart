// import 'package:allen/feature_box.dart';


// import 'package:animate_do/animate_do.dart';
import 'package:allen/model/chatUserModel.dart';
import 'package:allen/secren/chatscreen.dart';
import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _navigateToConversationPage(int conversationId) {
    Navigator.pushNamed(
      context,
      Chatscreen.screenrout , arguments: conversationId
    );
  }

final now2 = DateTime.now();
  List<ChatUsers> chatUsers = [
ChatUsers(name:"mohamma",time:"${DateTime.now()}",chat_id: 1)

  ];
  List<ConversationList> conversationlist = [
ConversationList(question:"",answer:"hi",chat_id:0,username: "mohammad")

  ];
void addChatUser( String name, String messageText, String time, int chat_id) {
  final newChatUser = ChatUsers(
    chat_id:chat_id+1 ,
    name: name,
    
    time: time,
  );

  setState(() {
    chatUsers.add(newChatUser);
  });
}
void addconversation( String answer, String question, int chat_id) {
  final newconversation= ConversationList(
    username: "mohammad",
    answer: answer,
    question: question,
    chat_id:chat_id,
  );

  setState(() {
   conversationlist.add(newconversation);
  });
}



int number_of_chat=1;
  DateTime now=DateTime.now();
  @override
  void initState() {
    super.initState();
    
    
   
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "Telegram",
            style: TextStyle(color: Colors.black),
          ),
          actions: [Icon(Icons.search)],
        ),
        body: ListView.builder(
            itemCount:chatUsers.length ,
            itemBuilder: (BuildContext context, int index,) {
          final conversationId = index + 1; // رقم المحادثة (يبدأ من 1)
          // final conversationName = 'محادثة $conversationId'; 
              return ListTile(
                onTap: () { 
                  _navigateToConversationPage(conversationId) ;              

                },
                leading: CircleAvatar(
                  child: FlutterLogo(),
                  radius: 25,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(chatUsers[index].name),
                    Text(
                      chatUsers[index].time,
                      
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    )
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("chat $index"),
                  
                  ],
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {print("add chat pleas");
final now = DateTime.now();
addChatUser("mohammad2","wlekom","$now",0);

     


},
          child: Icon(Icons.add),
        ),
        //////////////////////




      ),
    );
  }
}

