import 'package:allen/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:allen/secren/chatscreen.dart';
import 'package:allen/secren/registraion.dart';
late var token;
class signinscreen extends StatefulWidget {
  static const screenrout="signinscreen";
  const signinscreen({super.key});

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {

  getoken() async{
  SharedPreferences stor=await SharedPreferences.getInstance();
    
  token=  stor.getString("token");
  if (token == null){
    print("you shold first registration");
    Navigator.pushNamed(context,Registrationscreen.screenrout);
  }else {
    print("sucsese get token");
    print(token);
    Navigator.pushNamed(context,Chatscreen.screenrout);
   
  }
  
  
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
          onPressed:(){Navigator.pushNamed(context,Registrationscreen.screenrout);}, icon:const Icon(Icons.close),
        ),
      ]
      ),
     backgroundColor:Colors.white,
     body:Padding(
       padding: const EdgeInsets.all(24.0),
       child: Column(
        mainAxisAlignment : MainAxisAlignment.center,
        crossAxisAlignment : CrossAxisAlignment.center,
        children:[Container(
          height:100,
          child:Center(child: Image.asset('assets/images/virtualAssistant.png',))
          
          ),

          const SizedBox(height:40),


          Center(
            child: mybutton(color:Colors.blue[800]!,
             title: 'sign in ', onPressed:(){
               getoken();} ,),
          )
       
        ]
        
       ),
     )
    );
    
  }}