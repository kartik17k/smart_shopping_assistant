import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/pages/register.dart';
import 'main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            mainAxisAlignment:MainAxisAlignment.center, // Center the column vertically
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children to fill the column width
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 32, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight
                  color: Colors.white, // Set text color
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
              const SizedBox(height: 32), // Add space between elements
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
                obscureText: true, // Hide text for password input
                style: TextStyle(color: Colors.white), // Set text style
              ),
              const SizedBox(height: 32), // Add space between elements
              ElevatedButton(
                onPressed: () {
                  // Simulate login success and navigate to MainPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple[600], // Set button background color
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0), // Set padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white, // Set text color
                    fontSize: 16, // Set font size
                    fontWeight: FontWeight.bold, // Set font weight
                  ),
                ),
              ),
              const SizedBox(height: 10), // Add space between elements
              ElevatedButton.icon(
                onPressed: () async {
                  // Simulate login with Google and navigate to MainPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                icon: const Icon(Icons.login,
                    color: Colors.white), // Set icon and color
                label: const Text(
                  'Login with Google',
                  style: TextStyle(color: Colors.white), // Set text color
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.red[600], // Set button background color
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0), // Set padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ),
                ),
              ),
              const SizedBox(height: 10), // Add space between elements
              ElevatedButton.icon(
                onPressed: () {
                  // Simulate login with Facebook and navigate to MainPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                icon: const Icon(Icons.facebook,
                    color: Colors.white), // Set icon and color
                label: const Text(
                  'Login with Facebook',
                  style: TextStyle(color: Colors.white), // Set text color
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue[600], // Set button background color
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0), // Set padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ),
                ),
              ),
              const SizedBox(height: 10), // Add space between elements
              ElevatedButton.icon(
                onPressed: () {
                  // Simulate login with Apple and navigate to MainPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                icon: const Icon(Icons.apple,
                    color: Colors.white), // Set icon and color
                label: const Text(
                  'Login with Apple',
                  style: TextStyle(color: Colors.white), // Set text color
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.black54, // Set button background color
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0), // Set padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to RegisterPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: const Text(
                  'Don’t have an account? Register here',
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
