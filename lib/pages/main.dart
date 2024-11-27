import 'package:flutter/material.dart';
import '../Screens/budget.dart';
import '../Screens/home.dart';
import '../Screens/list.dart';
import '../Screens/setting.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

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
              Color(0xFF113F64),
              Color(0xFF1E1E1E), // Deep purple
              // Dark background
            ],
            stops: [0.0, 0.8],
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
                    _currentIndex = index;
                  });
                },
                physics:
                    const BouncingScrollPhysics(),
                children: _screens, // Optional, for smooth scroll effect
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
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2C),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, -3),
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: const Color(0xFF2C2C2C),
            selectedItemColor: Colors.blue[200],
            unselectedItemColor: Colors.grey[600],
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
            ),
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_rounded, size: 26),
                activeIcon: Icon(Icons.dashboard, size: 26),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted_rounded, size: 26),
                activeIcon: Icon(Icons.list_rounded, size: 26),
                label: 'Lists',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_rounded, size: 26),
                activeIcon: Icon(Icons.account_balance_wallet, size: 26),
                label: 'Budget',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tune_rounded, size: 26),
                activeIcon: Icon(Icons.settings, size: 26),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
