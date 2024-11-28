import 'package:flutter/material.dart';

// Stateful widget for setting a budget
class SetBudgetScreen extends StatefulWidget {
  const SetBudgetScreen({super.key});

  @override
  _SetBudgetScreenState createState() => _SetBudgetScreenState();
}

class _SetBudgetScreenState extends State<SetBudgetScreen> {
  double _budget = 0.0; // Variable to store the budget amount
  final TextEditingController _budgetController =
      TextEditingController(); // Controller for budget input field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Budget'), // App bar title
        backgroundColor:
            Theme.of(context).primaryColor, // App bar background color
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF113F64), // Deep blue
              Color(0xFF1E1E1E), // Dark gray
            ],
            stops: [0.0, 0.8], // Gradient stops
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.all(16.0), // Padding for the main container
            child: Container(
              padding: const EdgeInsets.all(20), // Padding inside the container
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(
                    0.1), // Container background color with opacity
                borderRadius: BorderRadius.circular(20), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.2), // Shadow color with opacity
                    offset: const Offset(0, 4), // Shadow offset
                    blurRadius: 15.0, // Shadow blur radius
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align children to the start
                children: <Widget>[
                  const Text(
                    'Set a budget for your shopping.', // Instruction text
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20), // Space between elements
                  const Text(
                    'Enter your shopping budget:', // Label for budget input
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  const SizedBox(height: 10), // Space between elements
                  TextField(
                    controller:
                        _budgetController, // Controller for the text field
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true), // Numeric input with decimal
                    decoration: InputDecoration(
                      labelText:
                          'Budget Amount', // Label text for the input field
                      labelStyle: const TextStyle(
                          color: Colors.white), // Label text style
                      border: const OutlineInputBorder(), // Border style
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Border color when enabled
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Colors.blue[200]!), // Border color when focused
                      ),
                    ),
                    style: const TextStyle(color: Colors.white), // Text style
                    onChanged: (value) {
                      setState(() {
                        _budget = double.tryParse(value) ??
                            0.0; // Update budget value
                      });
                    },
                  ),
                  const SizedBox(height: 20), // Space between elements
                  const Text(
                    'Or use the slider to set a budget:', // Label for slider
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  const SizedBox(height: 10), // Space between elements
                  Slider(
                    value: _budget, // Current value of the slider
                    min: 0, // Minimum value of the slider
                    max: 1000, // Maximum value of the slider
                    divisions: 100, // Number of divisions
                    label: _budget
                        .toStringAsFixed(0), // Label for the current value
                    onChanged: (double value) {
                      setState(() {
                        _budget = value; // Update budget value
                        _budgetController.text =
                            _budget.toStringAsFixed(0); // Update text field
                      });
                    },
                    activeColor: Colors.blue[200], // Slider thumb color
                    inactiveColor: Colors.grey, // Inactive slider color
                  ),
                  const SizedBox(height: 20), // Space between elements
                  Text(
                    'Selected Budget: \$${_budget.toStringAsFixed(2)}', // Display selected budget
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Spacer(), // Spacer to push the button to the bottom
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Action when the button is pressed
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Budget Set'), // Dialog title
                              content: Text(
                                  'Your budget is set to \$${_budget.toStringAsFixed(2)}'), // Dialog content
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'), // Button text
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close dialog
                                    setState(() {
                                      _budget = 0.0; // Reset budget value
                                      _budgetController
                                          .clear(); // Clear the field
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, // Button text color
                        backgroundColor: Theme.of(context)
                            .primaryColor, // Button background color
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24), // Button padding
                      ),
                      child: Text('Save Budget'), // Button label
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
