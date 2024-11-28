import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/pages/login.dart';

void main() {
  // for ios Preview
  runApp(
    DevicePreview(builder: (context) => SmartGroceryApp(),)
  );

  // for normal
  // runApp(SmartGroceryApp());
}

class SmartGroceryApp extends StatelessWidget {
  const SmartGroceryApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Grocery Assistant',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF113F64),
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      ),
      home: LoginPage(), // Start with LoginPage
    );
  }
}