import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsOn = true;
  double _targetCalories = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SwitchListTile(
              title: Text('Receive notifications'),
              value: _notificationsOn,
              onChanged: (newValue) {
                setState(() {
                  _notificationsOn = newValue;
                });
              },
            ),
            SizedBox(height: 24),
            Text(
              'Calorie Goal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Set your daily calorie goal',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Target Calories',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _targetCalories = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
