// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  bool isMale = true;
  double height = 180.0;
  int weight = 60;
  int age = 28;
  Color backgroundColor = Colors.grey[900]!; // Initial background color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                "BMI CALCULATOR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  _buildGenderButton("MALE", Icons.male, isMale),
                  const SizedBox(width: 16.0),
                  _buildGenderButton("FEMALE", Icons.female, !isMale),
                ],
              ),
              const SizedBox(height: 20),
              _buildHeightCard(),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  _buildWeightAgeCard("WEIGHT", weight, (value) {
                    setState(() {
                      weight = value;
                    });
                  }),
                  const SizedBox(width: 16.0),
                  _buildWeightAgeCard("AGE", age, (value) {
                    setState(() {
                      age = value;
                    });
                  }),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Calculate BMI
                  double bmi = calculateBMI(height, weight);

                  // Navigate to results screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => BMIResultsScreen(
                            bmi: bmi,
                            isMale: isMale,
                            age: age,
                          ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI(double height, int weight) {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  Widget _buildGenderButton(String label, IconData icon, bool isSelected) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            isMale = label == "MALE";
            backgroundColor =
                isMale
                    ? Colors.blue[900]!
                    : Colors.pink[900]!; // Change background color
          });
        },
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.grey[800] : Colors.grey[700],
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
      ),
    );
  }

  Widget _buildWeightAgeCard(String label, int value, Function(int) onChanged) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "$value",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    if (value > 1) {
                      onChanged(value - 1);
                    }
                  },
                  icon: const Icon(Icons.remove, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    onChanged(value + 1);
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeightCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "HEIGHT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${height.toStringAsFixed(1)} cm",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            value: height,
            min: 100.0,
            max: 220.0,
            onChanged: (newValue) {
              setState(() {
                height = newValue;
              });
            },
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}

// BMI Results Screen
class BMIResultsScreen extends StatelessWidget {
  final double bmi;
  final bool isMale;
  final int age;

  const BMIResultsScreen({
    super.key,
    required this.bmi,
    required this.isMale,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Results")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Your BMI: ${bmi.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              "Gender: ${isMale ? 'Male' : 'Female'}",
              style: const TextStyle(fontSize: 18),
            ),
            Text("Age: $age", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
