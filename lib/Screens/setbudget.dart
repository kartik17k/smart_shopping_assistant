import 'package:flutter/material.dart';

class SetBudgetScreen extends StatefulWidget {
  const SetBudgetScreen({super.key});

  @override
  _SetBudgetScreenState createState() => _SetBudgetScreenState();
}

class _SetBudgetScreenState extends State<SetBudgetScreen> {
  double _budget = 0.0;
  final TextEditingController _budgetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF113F64), // Deep blue
              Color(0xFF1E1E1E), // Dark gray
            ],
            stops: [0.0, 0.8], // Adjust gradient stop to match your style
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Set a budget for your shopping.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Enter your shopping budget:',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _budgetController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Budget Amount',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[200]!),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        _budget = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Or use the slider to set a budget:',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Slider(
                    value: _budget,
                    min: 0,
                    max: 1000,
                    divisions: 100,
                    label: _budget.toStringAsFixed(0),
                    onChanged: (double value) {
                      setState(() {
                        _budget = value;
                        _budgetController.text = _budget.toStringAsFixed(0);
                      });
                    },
                    activeColor: Colors.blue[200], // Slider thumb color
                    inactiveColor: Colors.grey, // Inactive slider color
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Selected Budget: \$${_budget.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Save the budget or navigate to the next screen
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Budget Set'),
                              content: Text(
                                  'Your budget is set to \$${_budget.toStringAsFixed(2)}'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
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
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Theme.of(context).primaryColor, // Button text color
                        padding:
                            const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      ),
                      child: Text('Save Budget'),
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
