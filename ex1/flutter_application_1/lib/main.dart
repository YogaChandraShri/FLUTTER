import 'package:flutter/material.dart';

void main(){
  runApp( Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Text("Hello Everyone",textAlign: TextAlign.center, style: TextStyle(decoration: TextDecoration.none,backgroundColor: Colors.lightBlueAccent,color: Colors.black),),
    );
  }
}
