import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(radius: 48),
            const SizedBox(height: 16),
            const Text('Your Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkGreen),
              onPressed: () {},
              child: const Text('Edit Profile'),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text('Log Out', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}