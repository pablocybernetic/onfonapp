import 'package:flutter/material.dart';
import 'package:onfonapp/conversation.dart';
// ignore: camel_case_types
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
      body: Container(
        // wrap the body with a background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onfon.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
        
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // height of the column

              children: <Widget>[
                ListTile(
                  // icon for each message
                  leading: const Icon(Icons.account_circle),
                  title: Text(
                    "Sender: $title",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  // background color for each message
                  tileColor: const Color.fromRGBO(187, 218, 247, 1),
                  //  tile coner radius for each message
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  leading: const Icon(Icons.message),
                  subtitle: Text(
                    body,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  trailing: Text(
                    timestamp,
                    style: const TextStyle(
                      fontSize: 7,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    userId,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    response,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  trailing: Text(
                    level,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    status,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    timestampResponded,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  trailing: Text(
                    carrier,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  
                ),
                  // floating action button
           FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConversationScreen(title: '',),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
