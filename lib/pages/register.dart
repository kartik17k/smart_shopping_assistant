import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/pages/login.dart';
import 'main.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Apply a gradient background to the container
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF113F64), // Start color
              Color(0xFF1E1E1E), // End color
            ],
            stops: [0.0, 0.8], // Define the gradient stops
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding around the child
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the column vertically
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Stretch children to fill the column width
            children: [
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 32, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight
                  color: Colors.white, // White text for visibility
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
              const SizedBox(height: 32), // Add space between elements
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name', // Set label text
                  labelStyle:
                      TextStyle(color: Colors.white70), // Set label text style
                  border: OutlineInputBorder(), // Set border style
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white54), // Set border color when enabled
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Set border color when focused
                  ),
                ),
                style: TextStyle(color: Colors.white), // Set text style
              ),
              const SizedBox(height: 16), // Add space between elements
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email', // Set label text
                  labelStyle:
                      TextStyle(color: Colors.white70), // Set label text style
                  border: OutlineInputBorder(), // Set border style
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white54), // Set border color when enabled
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Set border color when focused
                  ),
                ),
                style: TextStyle(color: Colors.white), // Set text style
              ),
              const SizedBox(height: 16), // Add space between elements
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password', // Set label text
                  labelStyle:
                      TextStyle(color: Colors.white70), // Set label text style
                  border: OutlineInputBorder(), // Set border style
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white54), // Set border color when enabled
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Set border color when focused
                  ),
                ),
                obscureText: true, // Hide text for password
                style: TextStyle(color: Colors.white), // Set text style
              ),
              const SizedBox(height: 16), // Add space between elements
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password', // Set label text
                  labelStyle:
                      TextStyle(color: Colors.white70), // Set label text style
                  border: OutlineInputBorder(), // Set border style
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white54), // Set border color when enabled
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Set border color when focused
                  ),
                ),
                obscureText: true, // Hide text for password confirmation
                style: TextStyle(color: Colors.white), // Set text style
              ),
              const SizedBox(height: 32), // Add space between elements
              ElevatedButton(
                onPressed: () {
                  // Add register functionality here
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MainPage()), // Navigate to MainPage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF113F64), // Set button background color
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0), // Set padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold), // Set text style
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to LoginPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginPage()), // Navigate to LoginPage
                  );
                },
                child: const Text(
                  'Already have an account? Login here',
                  style: TextStyle(color: Colors.white70), // Set text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
