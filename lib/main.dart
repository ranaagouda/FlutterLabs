import 'package:flutter/material.dart';

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
      body: Center(child: Container()),
    );
  }
}
