import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:onfonapp/constants/color.dart';
import 'package:onfonapp/conversation.dart';
import 'package:onfonapp/home.dart';

//Creating a class user to store the data;
class User {
  final String id;
  final String userId;
  final String title;
  final String body;
  final String timestamp;
  final String carrier;
  final String response;
  final String level;
  final String status;
  final String timestampResponded;
  User({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.timestamp,
    required this.carrier,
    required this.response,
    required this.level,
    required this.status,
    required this.timestampResponded,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Applying get request.

  Future<List<User>> getRequest() async {
    // restFull API
    final response = await http
        .get(Uri.parse("https://onfon.herokuapp.com/api/messages/message.php"));
    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to load internet');
    }
    print(response);

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          id: singleUser["id"],
          userId: singleUser["message_to"],
          title: singleUser["message_from"],
          body: singleUser["Message_body"],
          timestamp: singleUser["timestamp"],
          carrier: singleUser["carrier"],
          response: singleUser["response"],
          level: singleUser["level"],
          status: singleUser["processed_status"],
          timestampResponded: singleUser["timestamp_responded"]
          );
      //Addin g user to the list.
      users.add(user);      
    }
    return users;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  custom appbar
        appBar: AppBar(
          leading: Row(
            children: [
              Container(
                child: const Icon(
                  Icons.arrow_back,
                  // set size of icon
                  size: 35.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/images/onfon.jpg',
                  fit: BoxFit.cover,
                  height: 40.0,
                  width: 40.0,
                ),
              )
            ],
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Color.fromARGB(255, 96, 138, 230),
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: Center(
            child: Image.asset(
              'assets/images/onfon_logo.png',
              fit: BoxFit.cover,
              height: 60.0,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [purpleBack, blueBack, purpleBack],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

              // fit: BoxFit.cover,
            ),
          ),
          // column is used to create a vertical list
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    // text
                    semanticsLabel: 'Loading',
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.account_circle,
                          // set size of icon
                          size: 48.0,
                          color: Colors.blue,
                        ),
                        title: Text(
                          snapshot.data[index].title,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            // show only first 10 characters
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data[index].body,
                          style: const TextStyle(
                            fontSize: 12.0,
                            // show only first 100 characters
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.blue,
                          // on icon click  navigate to next page
                        ),
                        // pass data to next page
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConversationScreen(
                                // id: snapshot.data[index].id,
                                // userId: snapshot.data[index].userId,
                                title: snapshot.data[index].title,
                                // body: snapshot.data[index].body,
                                // timestamp: snapshot.data[index].timestamp,
                                // carrier: snapshot.data[index].carrier,
                                // response: snapshot.data[index].response,
                                // level: snapshot.data[index].level,
                                // status: snapshot.data[index].status,
                                // timestampResponded: snapshot.data[index].timestampResponded,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}