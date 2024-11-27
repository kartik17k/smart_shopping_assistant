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
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _checkIfFirstTime();
  }

  Future<void> _checkIfFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      prefs.setBool('isFirstTime', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TutorialScreen()),
      );
    } else {
      setState(() {
        _isFirstTime = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstTime) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Smart Grocery Assistant'),
        backgroundColor: Colors.transparent,
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListScreen()),
                      ),
                      child: _buildQuickAction(
                          icon: Icons.add_shopping_cart, label: 'New List'),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SetBudgetScreen()),
                      ),
                      child: _buildQuickAction(
                          icon: Icons.attach_money, label: 'Set Budget'),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SavedListsScreen()),
                      ),
                      child: _buildQuickAction(
                          icon: Icons.view_list, label: 'Saved Lists'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildSectionTitle('Shopping Insights'),
                Card(
                  color: Colors.white.withOpacity(0.1),
                  elevation: 4,
                  child: const ListTile(
                    leading: Icon(Icons.bar_chart, color: Colors.purple),
                    title: Text('Last Trip',
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text('Spent \$45 out of \$50 budget',
                        style: TextStyle(color: Colors.white70)),
                  ),
                ),
                Card(
                  color: Colors.white.withOpacity(0.1),
                  elevation: 4,
                  child: const ListTile(
                    leading: Icon(Icons.category, color: Colors.blue),
                    title: Text('Top Categories',
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text('Dairy, Snacks, Vegetables',
                        style: TextStyle(color: Colors.white70)),
                  ),
                ),
                const SizedBox(height: 20),
                _buildSectionTitle('Tip of the Day'),
                Card(
                  color: Colors.white.withOpacity(0.1),
                  elevation: 4,
                  child: const ListTile(
                    leading: Icon(Icons.lightbulb, color: Colors.orange),
                    title: Text('Save Money',
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text(
                        'Stick to your list and avoid shopping when hungry!',
                        style: TextStyle(color: Colors.white70)),
                  ),
                ),
                const SizedBox(height: 20),
                _buildSectionTitle('Recent Activity'),
                Card(
                  color: Colors.white.withOpacity(0.1),
                  elevation: 4,
                  child: const ListTile(
                    leading: Icon(Icons.history, color: Colors.grey),
                    title: Text('Last Shopping Trip',
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text('Oct 10: Purchased 12 items under budget.',
                        style: TextStyle(color: Colors.white70)),
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
          radius: 30,
          backgroundColor: const Color(0xFF134C85),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
