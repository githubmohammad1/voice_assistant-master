
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

int chat_id=1;
  List<ChatUsers> chatUsers = [
ChatUsers(name:"mohamma",time:"${DateTime.now()}",chat_id: 1)

  ];

void addChatUser( String name, String time,) {
  final newChatUser = ChatUsers(
    chat_id:chat_id+1 ,
    name: name,
    
    time: time,
  );

  setState(() {
    chatUsers.add(newChatUser);
  });
  chat_id+chat_id+1;
}


  @override
  void initState() {
    super.initState();
    
    
   
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            "Telegram",
            style: TextStyle(color: Colors.black),
          ),
          actions: [const Icon(Icons.search)],
        ),
        body: ListView.builder(
            itemCount:chatUsers.length ,
            itemBuilder: (BuildContext context, int index,) {
          final conversationId = index + 1; // رقم المحادثة (يبدأ من 1)
          
              return ListTile(
                onTap: () { 
                  _navigateToConversationPage(conversationId) ;              

                },
                leading: const CircleAvatar(
                  radius: 25,
                  child: FlutterLogo(),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(chatUsers[index].name),
                    Text(
                      chatUsers[index].time,
                      
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
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
          onPressed: () {print("add chat sucsecfully");
final now = DateTime.now();
addChatUser("mohammad","$now");

     


},
          child: const Icon(Icons.add),
        ),
        //////////////////////




      ),
    );
  }
}

