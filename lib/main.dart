import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const BirthdayBookApp());
}

class BirthdayBookApp extends StatelessWidget {
  const BirthdayBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
