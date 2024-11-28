import 'package:flutter/material.dart';
import '../Screens/budget.dart';
import '../Screens/home.dart';
import '../Screens/list.dart';
import '../Screens/setting.dart';

// MainPage is a StatefulWidget that manages the state of the main screen
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

// _MainPageState is the state class for MainPage
class _MainPageState extends State<MainPage> {
  int _currentIndex =
      0; // Tracks the current index of the bottom navigation bar
  final PageController _pageController =
      PageController(); // Controller for PageView

  // List of screens to display in the PageView
  final List<Widget> _screens = [
    HomeScreen(),
    ListScreen(),
    BudgetScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF113F64), // Start color of the gradient
              Color(0xFF1E1E1E), // End color of the gradient
            ],
            stops: [0.0, 0.8], // Gradient stops
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Use PageView to allow swipe navigation with animations
              PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index; // Update the current index
                  });
                },
                physics:
                    const BouncingScrollPhysics(), // Physics for the PageView
                children: _screens, // Screens to display in the PageView
              ),
              const Positioned(
                top: 16,
                right: 16,
                child: Row(
                  children: [
                    // You can add icons or other widgets here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // Animation duration
        decoration: BoxDecoration(
          color:
              const Color(0xFF2C2C2C), // Background color of the navigation bar
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              blurRadius: 15, // Blur radius for the shadow
              offset: const Offset(0, -3), // Offset for the shadow
              spreadRadius: 1, // Spread radius for the shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), // Top left corner radius
            topRight: Radius.circular(25), // Top right corner radius
          ),
          child: BottomNavigationBar(
            elevation: 0, // Elevation of the navigation bar
            backgroundColor: const Color(0xFF2C2C2C), // Background color
            selectedItemColor: Colors.blue[200], // Color for selected item
            unselectedItemColor: Colors.grey[600], // Color for unselected items
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600, // Font weight for selected label
              fontSize: 13, // Font size for selected label
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12, // Font size for unselected label
            ),
            type: BottomNavigationBarType.fixed, // Type of navigation bar
            currentIndex: _currentIndex, // Current index of the navigation bar
            onTap: (index) {
              setState(() {
                _currentIndex = index; // Update the current index
              });
              _pageController.animateToPage(index,
                  duration:
                      const Duration(milliseconds: 300), // Animation duration
                  curve: Curves.decelerate); // Animation curve
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_rounded, size: 26), // Icon for Home
                activeIcon:
                    Icon(Icons.dashboard, size: 26), // Active icon for Home
                label: 'Home', // Label for Home
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted_rounded,
                    size: 26), // Icon for Lists
                activeIcon:
                    Icon(Icons.list_rounded, size: 26), // Active icon for Lists
                label: 'Lists', // Label for Lists
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_rounded,
                    size: 26), // Icon for Budget
                activeIcon: Icon(Icons.account_balance_wallet,
                    size: 26), // Active icon for Budget
                label: 'Budget', // Label for Budget
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tune_rounded, size: 26), // Icon for Settings
                activeIcon:
                    Icon(Icons.settings, size: 26), // Active icon for Settings
                label: 'Settings', // Label for Settings
              ),
            ],
          ),
        ),
      ),
    );
  }
}
