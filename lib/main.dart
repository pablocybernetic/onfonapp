import 'package:flutter/material.dart';
import 'package:onfonapp/home.dart';
import 'package:onfonapp/login.dart';
import 'package:onfonapp/messages.dart';
import 'package:onfonapp/welcome.dart';

import 'conversation.dart';


void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'OnfonMedia',
      
      theme: ThemeData(
        
      
        primarySwatch: Colors.lightBlue,
      ),
      home:  LoginPage(),
    );
  }
}

