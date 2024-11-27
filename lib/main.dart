import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/pages/login.dart';

void main() {
  runApp(SmartGroceryApp());
}

class SmartGroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Grocery Assistant',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF113F64),
        scaffoldBackgroundColor: Color(0xFF1E1E1E),
      ),
      home: LoginPage(), // Start with LoginPage
    );
  }
}