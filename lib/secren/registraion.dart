import 'package:shared_preferences/shared_preferences.dart';
import 'package:allen/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:allen/django_server.dart';
import 'package:allen/secren/chatscreen.dart';
// import 'package:allen/secren/chatscreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';

final OpenAIService openAIService = OpenAIService();
class Registrationscreen extends StatefulWidget {
  static const screenrout="regitrationscreen";
  const Registrationscreen({super.key});

  @override
  State<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  // final _auth=FirebaseAuth.instance;               //firbase
  late String  email;
  late String username;
  late String password;

  savetoken(String token) async{
    SharedPreferences stor=await SharedPreferences.getInstance();
    stor.setString("token",token);
    // stor.getString("token");
    print("sucsese save token");
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:Colors.white,
     body:Padding(
       padding: const EdgeInsets.all(24.0),
       child: Column(
        mainAxisAlignment : MainAxisAlignment.center,
        crossAxisAlignment : CrossAxisAlignment.center,
        children:[Container(
          height:100,
          child:Image.asset('assets/images/virtualAssistant.png',)
          
          ),
          TextField(
               keyboardType:TextInputType.name,
            obscureText:true,
            textAlign:TextAlign.center
            ,
            onChanged:(value){username=value;},
            decoration:const InputDecoration(
              hintText:"Enter your username",
              contentPadding:EdgeInsets.symmetric(
                vertical:10,
                horizontal:20

              ),
              border:OutlineInputBorder(
                borderRadius :BorderRadius.all(Radius.circular(10))
              ),
              enabledBorder:OutlineInputBorder(
                borderSide:BorderSide(color:Colors.orange),
                borderRadius :BorderRadius.all(Radius.circular(10))
              ),
              focusedBorder:OutlineInputBorder(
                borderSide:BorderSide(width:3,color:Colors.blue),
                borderRadius :BorderRadius.all(Radius.circular(10))
              ),
            )
          ),
          const SizedBox(height:40),
          TextField(
            keyboardType:TextInputType.emailAddress,
            textAlign:TextAlign.center
            ,
            onChanged:(value){
              email=value;
            },
            decoration:const InputDecoration(
              hintText:"Enter your email",
              contentPadding:
                    EdgeInsets.symmetric(
                                         vertical:10,
                                          horizontal:20

                                        ),
              border:OutlineInputBorder(
                borderRadius :BorderRadius.all(Radius.circular(10))
              ),
              enabledBorder:OutlineInputBorder(
                borderSide:BorderSide(color:Colors.orange),
                borderRadius :BorderRadius.all(Radius.circular(10))
              ),
              focusedBorder:OutlineInputBorder(
                borderSide:BorderSide(width:3,color:Colors.blue),
                borderRadius :BorderRadius.all(Radius.circular(10))
              ),
            )
          ),

          const SizedBox(height:40),
            TextField(
               keyboardType:TextInputType.visiblePassword,
            obscureText:true,
            textAlign:TextAlign.center
            ,
            onChanged:(value){password=value;},
            decoration:const InputDecoration(
              hintText:"Enter your password",
              contentPadding:EdgeInsets.symmetric(
                vertical:10,
                horizontal:20

              ),
              border:OutlineInputBorder(
                borderRadius :BorderRadius.all(Radius.circular(10))
              ),
              enabledBorder:OutlineInputBorder(
                borderSide:BorderSide(color:Colors.orange),
                borderRadius :BorderRadius.all(Radius.circular(10))
              ),
              focusedBorder:OutlineInputBorder(
                borderSide:BorderSide(width:3,color:Colors.blue),
                borderRadius :BorderRadius.all(Radius.circular(10))
              ),
            )
          ),


          mybutton(color:Colors.blue[800]!,
           title: 'regester', onPressed:() async{
         
  
             // here i wil call functiono who will add user t

            try{
              final token = await openAIService.newregister(username,password,email);
              if (token== "errrors"){
              print("errrors");
              }else{
              await savetoken(token);}
              print("xxxxxxxxxxxxxx");

              Navigator.pushNamed(context,Chatscreen.screenrout);}
              catch(e){
                print(e);
              }
            
            
              
              
           }
           )



       
        ]
        
       ),
     )
    );
    
  }}