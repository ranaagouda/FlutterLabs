import 'package:flutter/material.dart';
import 'login.dart';
import 'chat.dart';
import 'bmi_calculator.dart'; // Make sure this is correctly named

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 24.0,
            ), // Add inner padding
          ),
        ),
      ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => LoginPage(),
        '/chat': (context) => ChatPage(),
        '/bmi': (context) => BMICalculatorScreen(), // Use the correct name
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Navigation')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Shorter Rows and Columns
              SizedBox(
                height: 100, // Adjust height as needed
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        height: double.infinity,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.purple,
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                width: 70, // Adjust width as needed
                                height: 40, // Adjust height as needed
                                color: Colors.yellow,
                              ),
                              Container(
                                width: 70, // Adjust width as needed
                                height: 40, // Adjust height as needed
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.blue,
                        height: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Navigation Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text('Go to Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                    child: const Text('Go to Chat'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/bmi');
                    },
                    child: const Text('Go to BMI'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
