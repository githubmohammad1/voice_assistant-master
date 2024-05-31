import 'dart:convert';

// import 'package:allen/secrets.dart';
// import 'package:allen/model/chatUserModel.dart';
import 'package:http/http.dart' as http;
String password ="";

String token ="";
String username="";
class OpenAIService{ 


  Future<String> chatGPTAPI(String prompt) async{
  var   headersList = {
 'Accept': '*/*',
 'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
 'Authorization': 'token 4892ace8a37d591f142d2d69250af0122665f355' };


var      url = Uri.parse('http://127.0.0.1:8000/api/test');


var      body =         { 'question': '$prompt' };

var      req =       http.MultipartRequest('POST', url);
req.headers.addAll(headersList);
req.fields.addAll(body);

var res = await req.send();
final resBody = await res.stream.bytesToString();


if (res.statusCode >= 200 && res.statusCode < 300) {
  print(resBody);
  return resBody;
}
else {print(res.reasonPhrase);
return "errors";}

  }



    
Future<String> newregister(String username,String password,String email) async {
var headersList = {
 'Content-Type': 'application/x-www-form-urlencoded' 
};
var url = Uri.parse('http://127.0.0.1:8000/api/users__register/');

var body = {
 'username': username,
 'password': password,
 'email' :email,
};

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.bodyFields = body;

var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode >= 200 && res.statusCode < 430) {

    final jsonBody = json.decode(resBody);

    // Extract the token (assuming it's in a field called 'token')
    final token = jsonBody['token'];

    // Return the token as a string
    return token.toString();
}
else {
  print(res.reasonPhrase);
return "errrors";
}
}


Future<String> login(String username,String email) async {
var headersList = {
 'Content-Type': 'application/x-www-form-urlencoded' 
};
var url = Uri.parse('http://127.0.0.1:8000/api/login');

var body = {
 'username': 'adminmosdf',
 'email': 'mohammad@gmil.com' 
};

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.bodyFields = body;

var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode >= 200 && res.statusCode < 300) {
     final jsonBody = json.decode(resBody);

    // Extract the token (assuming it's in a field called 'token')
    final token = jsonBody['token'];
    print(resBody);

    // Return the token as a string
    return token.toString();
  

}
else {
  print(res.reasonPhrase);
  return "errrors";
}
}



// ignore: non_constant_identifier_names


}
