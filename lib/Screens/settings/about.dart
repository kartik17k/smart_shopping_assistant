import 'package:flutter/material.dart';

// This class represents the About screen of the application.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .primaryColor, // Set the background color using the theme's primary color
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Make the app bar background transparent
        title: const Text('About'), // Title of the app bar
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF113F64), // Dark blue
              Color(0xFF1E1E1E), // Dark grey
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the content
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white
                  .withOpacity(0.05), // Background color with opacity
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            padding: const EdgeInsets.all(16.0), // Padding inside the container
            child: const Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align children to the start
              children: [
                Text(
                  'Smart Grocery Assistant', // App name
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10), // Space between elements
                Text(
                  'Version: 1.0.0', // App version
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 20), // Space between elements
                Text(
                  'This app helps you manage your shopping efficiently with features like list organization, budget tracking, and insights for smarter shopping.', // App description
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20), // Space between elements
                Text(
                  '© 2024 Smart Grocery Assistant Team', // Copyright information
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
