import 'package:flutter/material.dart';
import 'package:loginapp/components/chat.dart';
import 'package:loginapp/components/signin.dart';
import 'package:loginapp/components/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const welcome = './welcome';
  static const sign = './signin';
  static const chat = './chat';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Sign(
        onSubmit: (value) => print(value),
      ),
      routes: {
        './welcome': (context) => Welcome(),
        './signin': (context) => Sign(
              onSubmit: (value) => print(value),
            ),
        './chat':(context) => Chat()
      },
    );
  }
}
