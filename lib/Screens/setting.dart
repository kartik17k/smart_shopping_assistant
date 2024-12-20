import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/Screens/settings/about.dart';
import 'package:smart_shopping_assistant/Screens/settings/account.dart';
import 'package:smart_shopping_assistant/Screens/settings/help.dart';
import 'package:smart_shopping_assistant/Screens/settings/notification.dart';
import 'package:smart_shopping_assistant/Screens/settings/privacy.dart';

// This class represents the settings screen of the application.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Settings'), // Title of the app bar
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
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Build a card for account settings
            _buildSettingsCard(
              context,
              icon: Icons.person,
              title: 'Account Settings',
              color: Colors.blue,
              destination: AccountSettingsScreen(),
            ),
            // Build a card for notification preferences
            _buildSettingsCard(
              context,
              icon: Icons.notifications,
              title: 'Notification Preferences',
              color: Colors.orange,
              destination: NotificationPreferencesScreen(),
            ),
            // Build a card for privacy and security settings
            _buildSettingsCard(
              context,
              icon: Icons.lock,
              title: 'Privacy and Security',
              color: Colors.red,
              destination: PrivacySettingsScreen(),
            ),
            // Build a card for help and support
            _buildSettingsCard(
              context,
              icon: Icons.help,
              title: 'Help & Support',
              color: Colors.green,
              destination: HelpSupportScreen(),
            ),
            // Build a card for about section
            _buildSettingsCard(
              context,
              icon: Icons.info,
              title: 'About',
              color: Colors.purple,
              destination: AboutScreen(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a settings card
  Widget _buildSettingsCard(BuildContext context,
      {required IconData icon,
      required String title,
      required Color color,
      required Widget destination}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1), // Card background color
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      margin: const EdgeInsets.only(bottom: 16.0), // Margin between cards
      child: ListTile(
        leading: Icon(icon, size: 28, color: color), // Icon for the card
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 16, color: Colors.grey), // Arrow icon
        onTap: () {
          // Navigate to the destination screen when tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
