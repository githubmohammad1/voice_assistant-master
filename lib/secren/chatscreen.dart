
import 'package:allen/model/chatUserModel.dart';
import 'package:allen/secren/signin.dart';
import 'package:allen/pallete.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:speech_to_text/speech_to_text.dart';
import 'package:allen/django_server.dart';

import 'package:http/http.dart' as http;

import 'dart:convert'; 





class Chatscreen extends StatefulWidget {

  static const screenrout="Chatscreen";

  const Chatscreen({super.key}); 

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  int id=0;

  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  // ignore: unused_field
  bool _isListening = false;
  bool aligment=false;
  
  int start = 200;
  int delay = 200;
  final TextEditingController _messageController = TextEditingController();
 
  List<ChatUsers> chatUsers = [];
List m=[];

List<Conversation> conversation=[];


 Future<void> _sendMessage() async {
    
    final message = _messageController.text;

      if (message.isNotEmpty) {
      setState(()  {

         generateBotReply(message).then((value) {
         setState((){});
m.add('bot:$value');
          Conversation newConversation = Conversation(question:message,                                                                                            answer:value);
                        conversation.add(newConversation);});
          m.add('you: $message');
         
          _messageController.clear();
});


  //     for (var conversation in conversation) {
  //   print("Question: ${conversation.question}");
  //   print("Answer: ${conversation.answer}");
  //   print("---------------");
  // }
   

        
}   
    
    

    
  }
    Future<String> generateBotReply(String userMessage)  async{

      final speech = await openAIService.chatGPTAPI(userMessage);
      return speech;
  
  
    
    
  }


Future fetchConversations(int i) async {

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/re'), // Replace with your API URL
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {'username': 'mohammad', 'question': 'what is my name ffffffffffffff ', 'chat_id':'$i'},
    );
    print(response);
    print("--------------------------------");

    if (response.statusCode >= 200 && response.statusCode < 300) {
var mylistconversation= jsonDecode(response.body);
// Conversation newConversation1 = Conversation(question:"question", answer:"answer");
  for (final item in mylistconversation) {
    Conversation newConversation = Conversation(question:item['question'], answer:item['answer']);
    // print(item['question']);
    // print(item['answer']);
   m.add(item['question']);
setState(() {});        
setState(() {


m.add(item['answer']);
 conversation.add(newConversation);
       });
  
  
  }



 
    } else {
      print(response.reasonPhrase);
    }
  }

void  _loadReceivedMessage() async{
    // Retrieve the message passed from the previous page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        setState(() {
          id = ModalRoute.of(context)!.settings.arguments as int;
        print(id);

        });

      }
    });


  }

 
  @override
  void initState() {

  super.initState();
initSpeechToText();

print("___________________________________________________");
_loadReceivedMessage();
print(id);
WidgetsBinding.instance.addPostFrameCallback((_){
 fetchConversations(id);
});

 
print("------------");
print(id);

  
 print("init state");

 
  }







  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.blue,
        title:Row(
          children:[
            Image.asset('assets/images/virtualAssistant.png',height:50),
            const SizedBox(width:20),

            const Text("Messages"),
         


          ]
        ),
        actions:[IconButton(
          onPressed:(){Navigator.pushNamed(context,signinscreen.screenrout);
          // print(conversationId);
          }
, icon:const Icon(Icons.add),
        ),
        
      ]
      ),
      body:
     
      Column(


        children: [
    Expanded(
      child: ListView.builder(
    //        print("Question: ${conversation.question}");
    // print("Answer: ${conversation.answer}");
        reverse:false, // يعكس ترتيب الرسائل ليبدأ من الأسفل
        itemCount: m.length,//conversation.length,//_messages.length,
        itemBuilder: (context, index,) {
    // final conversation = _conversations[index];

// print(posts[index]["question"].runtimeType);

    
     
      print("--------------------------- $index");

    return Padding(
      padding:index % 2==1 ?
       const EdgeInsets.only(right: 150, bottom: 10):
       const EdgeInsets.only(left: 150, bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color:index % 2==1 ?
            Colors.red:
            Colors.amber,
             borderRadius:BorderRadius.circular(15)),
        child: Text(m[index])//conversation[index].question):Text(conversation[index].answer)//posts[index]["question"])//conversation.question),
      ),
    );








  
          
        },
      ),
    ),
  


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onSubmitted:(String v){

                     _sendMessage;
                    print(v);},
                    
                    decoration: const InputDecoration(
                      hintText: "write your question here",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
              ),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed:()async{ 
                    setState(() {});
                    systemstopSpeak;},
                ),
                // زر الإجراء العائم
          ZoomIn(
            
            delay: Duration(milliseconds: start + 3 * delay),
            child: FloatingActionButton(
              backgroundColor: Pallete.firstSuggestionBoxColor,
              onPressed: () async {
                if (await speechToText.hasPermission && speechToText.isNotListening) {
                  await startListening();
                } else if (speechToText.isListening) {
                  final speech = await openAIService.chatGPTAPI(lastWords);
                  
                  if (lastWords.isNotEmpty) {
              Conversation newConversation = Conversation(question:speech, answer:lastWords);
          // setState((){});
       setState((){   conversation.add(newConversation);});
              
                                           };

                  
                  generatedContent = speech;
                  setState(() {});
                  
                  
                  await systemSpeak(speech);
                }
                await stopListening();
              },
              child: Icon(speechToText.isListening ? Icons.stop : Icons.mic),
            ),
          ),
              ],
            ),
          ),
        ],
      ),
      
      
    );
  
}
  Future<void> initSpeechToText() async {
    await speechToText.initialize(
            onError: (error) => print('Error: $error'),
           onStatus: (status) => print('Status: $status'),
    );
 
  }
  
  Future<void> startListening() async {
    print("start_lissssssss");
    setState(() => _isListening = true);
    lastWords = await speechToText.listen(
      onResult: (result) => setState(() => lastWords = result.recognizedWords),
    );
    setState(() => _isListening = false);
  }

  Future<void> stopListening() async {
    print("stop_less");
    await speechToText.stop();
    
    
    setState(() => _isListening = false);
  }


  Future<void> systemSpeak(String content) async {
    print("speeek");
    // await flutterTts.setLanguage("un");
    await flutterTts.setPitch(1);
    await flutterTts.speak(content);
    
    
  }
 Future<void> systemstopSpeak(String content) async {
    
   
    await flutterTts.stop();
    
    print("stop listin");
  }

}
