import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/pages/login.dart';

void main() {
  // Run the app with DevicePreview for iOS preview
  runApp(DevicePreview(
    builder: (context) => SmartGroceryApp(),
  ));

  // Uncomment the line below to run the app normally without DevicePreview
  //  runApp(SmartGroceryApp());
}

class SmartGroceryApp extends StatelessWidget {
  const SmartGroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Build the MaterialApp with a dark theme and set LoginPage as the home screen
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      title: 'Smart Grocery Assistant', // Set the title of the app
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF113F64), // Set the primary color
        scaffoldBackgroundColor:
            const Color(0xFF1E1E1E), // Set the scaffold background color
      ),
      home: LoginPage(), // Start with LoginPage
    );
  }
}
