import 'package:flutter/material.dart';

class NotificationPreferencesScreen extends StatefulWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  _NotificationPreferencesScreenState createState() =>
      _NotificationPreferencesScreenState();
}

class _NotificationPreferencesScreenState
    extends State<NotificationPreferencesScreen> {
  // State variables for the toggles
  bool _promotionalNotifications = true;
  bool _reminderNotifications = false;
  bool _appUpdatesNotifications = true;

  // Method to handle state changes and show a SnackBar
  void _onToggle(String type, bool value) {
    setState(() {
      if (type == 'Promotional') {
        _promotionalNotifications = value;
      } else if (type == 'Reminder') {
        _reminderNotifications = value;
      } else if (type == 'App Updates') {
        _appUpdatesNotifications = value;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$type Notifications ${value ? "Enabled" : "Disabled"}',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Notification Preferences'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF113F64), // Dark blue color
              Color(0xFF1E1E1E), // Dark grey color
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.only(bottom: 12),
              child: SwitchListTile(
                activeColor: const Color(0x00e5e5e5),
                title: const Text('Promotional Notifications',
                    style: TextStyle(color: Colors.white)),
                subtitle: const Text(
                  'Get notified about sales and discounts.',
                  style: TextStyle(color: Colors.grey),
                ),
                value: _promotionalNotifications,
                onChanged: (value) => _onToggle('Promotional', value),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.only(bottom: 12),
              child: SwitchListTile(
                activeColor: const Color(0x00e5e5e5),
                title: const Text('Reminder Notifications',
                    style: TextStyle(color: Colors.white)),
                subtitle: const Text(
                  'Receive shopping reminders.',
                  style: TextStyle(color: Colors.grey),
                ),
                value: _reminderNotifications,
                onChanged: (value) => _onToggle('Reminder', value),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SwitchListTile(
                activeColor: const Color(0x00e5e5e5),
                title:
                    const Text('App Updates', style: TextStyle(color: Colors.white)),
                subtitle: const Text(
                  'Stay updated with new features and releases.',
                  style: TextStyle(color: Colors.grey),
                ),
                value: _appUpdatesNotifications,
                onChanged: (value) => _onToggle('App Updates', value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
