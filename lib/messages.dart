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
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));


	var responseData = json.decode(response.body);

	//Creating a list to store input data;
	List<User> users = [];
	for (var singleUser in responseData) {
	User user = User(
		id: singleUser["id"],
		userId: singleUser["userId"],
		title: singleUser["title"],
		body: singleUser["completed"]);

	//Adding user to the list.
	users.add(user);
	}
	return users;
}

@override
Widget build(BuildContext context) {
	return SafeArea(
	child: Scaffold(
		appBar: AppBar(
		title: Text("All messages"),
		leading: Icon(
			Icons.message,
		),
		),
		body: Container(
      // column is used to create a vertical list
		padding: EdgeInsets.all(16.0),
		child: FutureBuilder(
			future: getRequest(),
			builder: (BuildContext ctx, AsyncSnapshot snapshot) {
			if (snapshot.data == null) {
				return Container(
				child: Center(
					child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            // text
            semanticsLabel: 'Loading',
          ),
				),
				);
			} else {
				return ListView.builder(
				itemCount: snapshot.data.length,
				itemBuilder: (ctx, index) => ListTile(
					title: Text(snapshot.data[index].title),
					subtitle: Text(snapshot.data[index].body),
					contentPadding: EdgeInsets.only(bottom: 20.0),
				),
				);
			}
			},
		),
		),
	),
	);
}
}
