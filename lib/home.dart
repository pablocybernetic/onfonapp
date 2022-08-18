import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class homescreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  // static const homescreen;
  final String title;
  final String body;
  final String timestamp;
  final String carrier;
  final String response;
  final String level;
  final String status;
  final String timestampResponded;
  final String userId;
  
  final String id;
  const homescreen({
    Key? key,
    required this.title,
    required this.body,
    required this.timestamp,
    required this.carrier,
    required this.response,
    required this.level,
    required this.status,
    required this.timestampResponded,
    required this.userId,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnfonMedia'),
      ),
      body: Center(
        // display the value of the id
        child: Text('id: $id'),
        ),
      
      );}}
