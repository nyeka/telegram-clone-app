import 'package:flutter/material.dart';
import 'package:loginapp/main.dart';
import './signin.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      name = name;
    });
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Colors.blueAccent),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Welcome $name, nice to meet you',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(MyApp.chat);
                      },
                      child: Text('Let\'s Go')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Wrong Account?')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
