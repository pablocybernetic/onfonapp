// conversation screen
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import http
import 'package:http/http.dart' as http;
import 'package:soundpool/soundpool.dart';
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
class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  // get request
  Future<List<User>> getRequest() async {
    // restFull API
    final response = await http.get(Uri.parse("https://onfon.herokuapp.com/api/messages/message.php"));
    if (response.statusCode == 200) {
      // print(response.body);
    } else {
      throw Exception('Failed to load internet');
    }
    var responseData = json.decode(response.body);
    // print(responseData);
    // Creating a list to store input data;
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
          timestampResponded: singleUser["timestamp_responded"]);
      users.add(user);
      // print(users);
    }
    return users;
  }
  final message = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('OnfonMedia'),
        ),
        body: Container(
            //             decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/whatsapp.jpg"),
            //     // fit: BoxFit.cover,
            //   ),
            // ),
            color: Color.fromRGBO(3, 129, 155, 1),
            // background image
            child: Column(
              children: [
                
                // futureBuilder and get request
                //
                Expanded(
              child:  FutureBuilder(
                  future: getRequest(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text("Loading..."),
                      );
                      
                    } else { 
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                               margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 97, 130, 208),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),

                              child: ListTile(
                              leading: const Icon(Icons.account_circle),
                              dense: true,
                              title: Text(snapshot.data[index].title, 
                               style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              )
                              ), 
                            subtitle: Text(snapshot.data[index].body
                            ,style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            )
                            ),
                            ));
                            
                          });
                    }
                  },
                ),),
                 
              
                Container(
                  // background image

                  // margin: EdgeInsets.all(15.0),
                  // height: 61,
                  // image background

                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35.0),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 5,
                                    color: Colors.grey)
                              ],
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                    icon: const Icon(
                                      Icons.message,
                                      color: Colors.blueAccent,
                                    ),
                                    onPressed: () {}),
                                Expanded(
                                  child: TextField(
                                    // CONTROLLER
                                    controller: message,
                                    decoration: const InputDecoration(
                                        hintText: "Type Something...",
                                        hintStyle:
                                            TextStyle(color: Colors.blueAccent),
                                        border: InputBorder.none),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.photo_camera,
                                      color: Colors.blueAccent),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.attach_file,
                                      color: Colors.blueAccent),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: const BoxDecoration(
                              color: Colors.blueAccent, shape: BoxShape.circle),
                          child: InkWell(
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            onTap: () async {
                              // send message
                              var headers = {
                                'Content-Type': 'application/json',
                                'Cookie':
                                    'PHPSESSID=ijthim19qd8rjts5q6jsftgv0p0c3j9s'
                              };
                              var request = http.Request(
                                  'POST',
                                  Uri.parse(
                                      'https://onfon.herokuapp.com/api/messages/message.php'));
                              request.body = json.encode({
                                "message_from": "+254705374455",
                                "message_to": "22141",
                                "message_body": message.text.toString(),
                                "carrier": "Faiba"
                              });
                               message.clear();

                              request.headers.addAll(headers);

                              http.StreamedResponse response =
                                  await request.send();
                              print(message.text.toString());
                              print('Response status: ${response.statusCode}');
                              final String reply =
                                  await response.stream.bytesToString();
                              if (response.statusCode < 300) {
                                // audio notification
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(const SnackBar(
                                //   content: Text('Message sent'),
                                // ));
                                Soundpool pool = Soundpool(
                                    streamType: StreamType.notification);

                                int soundId = await rootBundle
                                    .load("assets/sounds/sentmessage.mp3")
                                    .then((ByteData soundData) {
                                  return pool.load(soundData);
                                });
                                int streamId = await pool.play(soundId);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      // Retrieve the text the that user has entered by using the
                                      // display response body
                                      content: Text(reply),
                                      elevation: 24.0,
                                      backgroundColor:
                                          Color.fromARGB(255, 61, 184, 228),
                                    );
                                  },
                                );
                              }
                              // clear the text field
                              // refresh the screen
                              setState(() {});
                              // notification sound
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
  
}
