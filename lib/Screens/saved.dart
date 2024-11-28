import 'package:flutter/material.dart';

class SavedListsScreen extends StatelessWidget {
  // List of saved lists with their titles and items
  final List<Map<String, dynamic>> savedLists = [
    {
      'title': 'Weekly Groceries',
      'items': [
        {'name': 'Milk', 'quantity': 2, 'category': 'Dairy'},
        {'name': 'Eggs', 'quantity': 12, 'category': 'Dairy'},
        {'name': 'Bread', 'quantity': 1, 'category': 'Bakery'},
        {'name': 'Cheese', 'quantity': 1, 'category': 'Dairy'},
        {'name': 'Tomatoes', 'quantity': 3, 'category': 'Vegetables'},
        {'name': 'Potatoes', 'quantity': 5, 'category': 'Vegetables'},
      ],
    },
    {
      'title': 'Party Essentials',
      'items': [
        {'name': 'Chips', 'quantity': 3, 'category': 'Snacks'},
        {'name': 'Soda', 'quantity': 5, 'category': 'Beverages'},
        {'name': 'Cake', 'quantity': 1, 'category': 'Desserts'},
        {'name': 'Plastic Cups', 'quantity': 50, 'category': 'Accessories'},
        {'name': 'Napkins', 'quantity': 100, 'category': 'Accessories'},
        {'name': 'Pizza', 'quantity': 2, 'category': 'Meals'},
      ],
    },
    {
      'title': 'Healthy Diet',
      'items': [
        {'name': 'Spinach', 'quantity': 2, 'category': 'Vegetables'},
        {'name': 'Avocados', 'quantity': 4, 'category': 'Fruits'},
        {'name': 'Almonds', 'quantity': 1, 'category': 'Nuts'},
        {'name': 'Greek Yogurt', 'quantity': 6, 'category': 'Dairy'},
        {'name': 'Oats', 'quantity': 1, 'category': 'Grains'},
      ],
    },
    {
      'title': 'BBQ Night',
      'items': [
        {'name': 'Chicken Wings', 'quantity': 10, 'category': 'Meat'},
        {'name': 'BBQ Sauce', 'quantity': 2, 'category': 'Condiments'},
        {'name': 'Corn', 'quantity': 6, 'category': 'Vegetables'},
        {'name': 'Charcoal', 'quantity': 3, 'category': 'Accessories'},
        {'name': 'Coleslaw', 'quantity': 1, 'category': 'Salads'},
      ],
    },
    {
      'title': 'Office Snacks',
      'items': [
        {'name': 'Granola Bars', 'quantity': 10, 'category': 'Snacks'},
        {'name': 'Nuts', 'quantity': 3, 'category': 'Snacks'},
        {'name': 'Coffee', 'quantity': 2, 'category': 'Beverages'},
        {'name': 'Biscuits', 'quantity': 5, 'category': 'Snacks'},
        {'name': 'Tea Bags', 'quantity': 50, 'category': 'Beverages'},
      ],
    },
  ];

  SavedListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Lists'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
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
        child: ListView.builder(
          itemCount: savedLists.length,
          itemBuilder: (context, index) {
            final list = savedLists[index];
            return Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color:
                  Colors.white.withOpacity(0.1), // Transparent card background
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                title: Text(
                  list['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  'Items: ${list['items'].map((item) => '${item['name']} (${item['quantity']}, ${item['category']})').join(', ')}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListDetailsScreen(list: list),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> list;

  const ListDetailsScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list['title']),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
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
        child: ListView.builder(
          itemCount: list['items'].length,
          itemBuilder: (context, index) {
            return Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color:
                  Colors.white.withOpacity(0.1), // Transparent card background
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                leading: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: Text(
                    list['items'][index]['name'][0].toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  list['items'][index]['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'Quantity: ${list['items'][index]['quantity']} | Category: ${list['items'][index]['category']}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
