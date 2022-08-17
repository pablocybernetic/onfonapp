import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onfonapp/home.dart';

//Creating a class user to store the data;
class User {
  final int id;
  final int userId;
  final String title;
  final String body;

  User({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Applying get request.

  Future<List<User>> getRequest() async {
    // restFull API
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          id: singleUser["id"],
          userId: singleUser["userId"],
          title: singleUser["title"],
          body: singleUser["body"]);

      //Adding user to the list.
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
          title: const Text("OnfonMedia"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          
        ),
        body: Container(
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
                        ),
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
