import 'package:flutter/material.dart';
import 'package:onfonapp/home.dart';
import 'package:onfonapp/messages.dart';
import 'package:onfonapp/grid.dart';

import 'view_single_item.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnfonMedia',
      
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
        // backgroundColor: Color.fromARGB(255, 218, 115, 115)
      ),
      // home: const MyHomePage(title: 'OnfonMedia'),
      home:  HomePage(),
    );
  }
}

