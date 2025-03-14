import 'package:flutter/material.dart';
import 'login.dart';
import 'chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
      ),
      home: SimplePage(),
    );
  }
}

class SimplePage extends StatefulWidget {
  const SimplePage({super.key});

  @override
  State<SimplePage> createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  int _starCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hello World'),
        backgroundColor: Colors.yellowAccent,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {
              setState(() {
                _starCount++;
              });
            },
          ),
          Center(child: Text('$_starCount')),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(flex: 1, child: Container(color: Colors.red)),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.purple,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                width: 90,
                                height: 50,
                                color: Colors.yellow,
                              ),
                              Container(
                                width: 90,
                                height: 50,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container(color: Colors.blue)),
                ],
              ),
            ),
            // Buttons in a Row with spacing
            Padding(
              padding: const EdgeInsets.all(8.0), // Add padding around the row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Add spacing
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Go to Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatPage()),
                      );
                    },
                    child: Text('Go to Chat'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
