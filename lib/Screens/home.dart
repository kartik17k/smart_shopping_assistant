import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_shopping_assistant/Screens/saved.dart';
import 'package:smart_shopping_assistant/Screens/setbudget.dart';
import 'package:smart_shopping_assistant/Screens/tutorial.dart';

import 'list.dart';

void main() {
  runApp(SmartGroceryApp());
}

class SmartGroceryApp extends StatelessWidget {
  const SmartGroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      home: HomeScreen(), // Set HomeScreen as the home widget
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isFirstTime = true; // Track if it's the user's first time

  @override
  void initState() {
    super.initState();
    _checkIfFirstTime(); // Check if it's the user's first time
  }

  Future<void> _checkIfFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      prefs.setBool('isFirstTime', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TutorialScreen()), // Navigate to TutorialScreen
      );
    } else {
      setState(() {
        _isFirstTime = false; // Update state if not first time
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstTime) {
      return const Center(
          child:
              CircularProgressIndicator()); // Show loading indicator if first time
    }

    return Scaffold(
      backgroundColor:
          Colors.transparent, // Set background color to transparent
      appBar: AppBar(
        title: const Text('Smart Grocery Assistant'), // Set app bar title
        backgroundColor:
            Colors.transparent, // Set app bar background color to transparent
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Add padding around the child
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align children to the start
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white), // Set text style
                ),
                const SizedBox(height: 20), // Add space between elements
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround, // Distribute space evenly
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ListScreen()), // Navigate to ListScreen
                      ),
                      child: _buildQuickAction(
                          icon: Icons.add_shopping_cart,
                          label: 'New List'), // Build quick action button
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SetBudgetScreen()), // Navigate to SetBudgetScreen
                      ),
                      child: _buildQuickAction(
                          icon: Icons.attach_money,
                          label: 'Set Budget'), // Build quick action button
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SavedListsScreen()), // Navigate to SavedListsScreen
                      ),
                      child: _buildQuickAction(
                          icon: Icons.view_list,
                          label: 'Saved Lists'), // Build quick action button
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Add space between elements
                _buildSectionTitle('Shopping Insights'), // Build section title
                Card(
                  color: Colors.white
                      .withOpacity(0.1), // Set card color with opacity
                  elevation: 4, // Set card elevation
                  child: const ListTile(
                    leading: Icon(Icons.bar_chart,
                        color: Colors.purple), // Set leading icon
                    title: Text('Last Trip',
                        style: TextStyle(
                            color: Colors.white)), // Set title text style
                    subtitle: Text('Spent \$45 out of \$50 budget',
                        style: TextStyle(
                            color: Colors.white70)), // Set subtitle text style
                  ),
                ),
                Card(
                  color: Colors.white
                      .withOpacity(0.1), // Set card color with opacity
                  elevation: 4, // Set card elevation
                  child: const ListTile(
                    leading: Icon(Icons.category,
                        color: Colors.blue), // Set leading icon
                    title: Text('Top Categories',
                        style: TextStyle(
                            color: Colors.white)), // Set title text style
                    subtitle: Text('Dairy, Snacks, Vegetables',
                        style: TextStyle(
                            color: Colors.white70)), // Set subtitle text style
                  ),
                ),
                const SizedBox(height: 20), // Add space between elements
                _buildSectionTitle('Tip of the Day'), // Build section title
                Card(
                  color: Colors.white
                      .withOpacity(0.1), // Set card color with opacity
                  elevation: 4, // Set card elevation
                  child: const ListTile(
                    leading: Icon(Icons.lightbulb,
                        color: Colors.orange), // Set leading icon
                    title: Text('Save Money',
                        style: TextStyle(
                            color: Colors.white)), // Set title text style
                    subtitle: Text(
                        'Stick to your list and avoid shopping when hungry!',
                        style: TextStyle(
                            color: Colors.white70)), // Set subtitle text style
                  ),
                ),
                const SizedBox(height: 20), // Add space between elements
                _buildSectionTitle('Recent Activity'), // Build section title
                Card(
                  color: Colors.white
                      .withOpacity(0.1), // Set card color with opacity
                  elevation: 4, // Set card elevation
                  child: const ListTile(
                    leading: Icon(Icons.history,
                        color: Colors.grey), // Set leading icon
                    title: Text('Last Shopping Trip',
                        style: TextStyle(
                            color: Colors.white)), // Set title text style
                    subtitle: Text('Oct 10: Purchased 12 items under budget.',
                        style: TextStyle(
                            color: Colors.white70)), // Set subtitle text style
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction({required IconData icon, required String label}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30, // Set circle avatar radius
          backgroundColor: const Color(0xFF134C85), // Set background color
          child: Icon(icon,
              color: Colors.white, size: 30), // Set icon color and size
        ),
        const SizedBox(height: 8), // Add space between elements
        Text(label,
            style: const TextStyle(
                fontSize: 14, color: Colors.white)), // Set text style
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white), // Set text style
      ),
    );
  }
}
