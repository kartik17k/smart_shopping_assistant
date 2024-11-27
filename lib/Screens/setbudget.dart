import 'package:flutter/material.dart';

class SetBudgetScreen extends StatefulWidget {
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
        decoration: BoxDecoration(
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
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 4),
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Set a budget for your shopping.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enter your shopping budget:',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _budgetController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Budget Amount',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[200]!),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        _budget = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Or use the slider to set a budget:',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  SizedBox(height: 10),
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
                  SizedBox(height: 20),
                  Text(
                    'Selected Budget: \$${_budget.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Save the budget or navigate to the next screen
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Budget Set'),
                              content: Text(
                                  'Your budget is set to \$${_budget.toStringAsFixed(2)}'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
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
                      child: Text('Save Budget'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Theme.of(context).primaryColor, // Button text color
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      ),
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
