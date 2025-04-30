// screens/profile_screen.dart
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(title: 'My Profile'),
      ),
      body: const Center(child: Text('User profile details will go here.')),
    );
  }
}
