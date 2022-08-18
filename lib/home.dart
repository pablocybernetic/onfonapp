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
        // card for each message
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                // icon for each message
                leading: Icon(Icons.account_circle),
                title: Text(
                  
                  "Sender: "+title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                // background color for each message
                 tileColor: Color.fromRGBO(187, 218, 247, 1),
                //  tile coner radius for each message
                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                leading: Icon(Icons.message),
                  subtitle: Text(
                  body,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: Text(
                  timestamp,
                  style: TextStyle(
                    fontSize: 7,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  userId,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  response,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: Text(
                  level,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  status,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  timestampResponded,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: Text(
                  carrier,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
       
        ),
      
      );}}
