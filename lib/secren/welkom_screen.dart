import 'package:allen/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:allen/secren/signin.dart';
import 'package:allen/secren/registraion.dart';
class welkomscreen extends StatefulWidget {
  static const screenrout="welkom_screen"; 
  const welkomscreen({super.key});

  @override
  State<welkomscreen> createState() => _welkomscreenState();
}

class _welkomscreenState extends State<welkomscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal:24),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment : CrossAxisAlignment.stretch,
          children: [
          Column(children: [
            Container(
              
              child: Image.asset('assets/images/virtualAssistant.png'),
              height: 100,
        
            ),
            Text("welkom",style:TextStyle(fontSize:40)),
        
          ],
          ),
          SizedBox(height:30),
          mybutton(
            color:Colors.yellow,
            title:"sign in",
            onPressed:(){
              Navigator.pushNamed(context,signinscreen.screenrout);
            }
          ),
          mybutton(
            color:Colors.blue,
            title:"register",
            onPressed:(){
              Navigator.pushNamed(context,Registrationscreen.screenrout);
            }
          ),


        ],
        
        ),
      )
    );
  }
}

 