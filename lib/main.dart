// import 'package:allen/home_page.dart';
// import 'package:allen/model/chatUserModel.dart';
import 'package:allen/home_page.dart';
import 'package:allen/pallete.dart';
import 'package:allen/secren/chatscreen.dart';
import 'package:allen/secren/registraion.dart';
import 'package:allen/secren/signin.dart';
import 'package:allen/secren/welkom_screen.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nativ boat',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Pallete.whiteColor,
        ),
      ),
       home:  HomePage(),
      // initialRoute:chatscreen.screenrout,
      routes:{
      welkomscreen.screenrout:(context) => const welkomscreen(),
        signinscreen.screenrout:(context) => const signinscreen(),
        Registrationscreen.screenrout:(context) => const Registrationscreen(),
       Chatscreen.screenrout:(context) => Chatscreen(),
        

      }
    );

  }
}



