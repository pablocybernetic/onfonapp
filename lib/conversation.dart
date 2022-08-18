// conversation screen
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnfonMedia'),
      ),
      body: Column(
        children: [
          Container(
            
          child: Expanded(
            
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(
                    'Sender: index',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),),
      Container(
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
                        offset: Offset(0, 3), blurRadius: 5, color: Colors.grey)
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
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Type Something...",
                            hintStyle: TextStyle(color: Colors.blueAccent),
                            border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.photo_camera, color: Colors.blueAccent),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.attach_file, color: Colors.blueAccent),
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
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    ),
    ],
    )
      );
      
  }
}
