import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String email;
  final String army;

  ProfilePage({required this.email, required this.army});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imperial Fitness'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            SizedBox(height: 16),
            Text(
              email,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Rank: ${getRank(army)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 16),
            Text(
              'Experience: 500/1000',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }

  String getRank(String army) {
    switch (army) {
      case 'Ultramarines':
        return 'Chapter Master';
      case 'Blood Angels':
        return 'Chapter Master';
      case 'Dark Angels':
        return 'Grand Master';
      case 'Imperial Fists':
        return 'Chapter Master';
      case 'Space Wolves':
        return 'Great Wolf';
      case 'White Scars':
        return 'Khan';
      case 'Raven Guard':
        return 'Master of Shadows';
      case 'Salamanders':
        return 'Vulkan He'stan';
      case 'Iron Hands':
        return 'Iron Father';
      case 'Night Lords':
        return 'Night Haunter';
      case 'Alpha Legion':
        return 'Alpharius';
      case 'World Eaters':
        return 'Kharn the Betrayer';
      case 'Emperor\'s Children':
        return 'Lucius the Eternal';
      case 'Thousand Sons':
        return 'Ahriman';
      case 'Death Guard':
        return 'Typhus';
      case 'World Bearers':
        return 'Dark Apostle';
      case 'Word Bearers':
        return 'Dark Apostle';
      case 'Black Legion':
        return 'Abaddon the Despoiler';
      default:
        return 'Astartes';
    }
  }
}