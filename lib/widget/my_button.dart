import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  const mybutton({required this.color,required this.title,
  required this.onPressed
    
  });
  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(elevation:5,
      color:color,
      child:MaterialButton(onPressed:onPressed,
      minWidth:200,
      height:40,child:Text(title)),
      ),
    );
  }
}