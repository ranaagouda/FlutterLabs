import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ChatPage());
  }
}

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  
  final List<Map<String, String>> chatData = [
    {'name': 'Ahmed', 'message': 'My name is Ahmed', 'time': '02:00 am'},
    {'name': 'Mohamed', 'message': 'My name is Mohamed', 'time': '01:00 am'},
    {'name': 'Anas', 'message': 'My name is Anas', 'time': '12:00 am'},
    {'name': 'Sara', 'message': 'My name is Sara', 'time': '11:00 am'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
          IconButton(icon: Icon(Icons.edit), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index == 0) // Display the top row of avatars only once
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              5,
                              (avatarIndex) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                child: Column(
                                  children: [
                                    CircleAvatar(child: Icon(Icons.person)),
                                    Text(
                                      'Adham Ashraf ...',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ListTile(
                      leading: CircleAvatar(child: Icon(Icons.person)),
                      title: Text(chatData[index]['name']!),
                      subtitle: Text(chatData[index]['message']!),
                      trailing: Text(chatData[index]['time']!),
                    ),
                    Divider(height: 1), // Add a divider between items
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
