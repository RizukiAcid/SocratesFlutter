// screens/home_screen.dart
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/service_grid.dart';
import '../widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(title: 'Traveloka'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          BannerCarousel(),
          SizedBox(height: 16),
          ServiceGrid(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 1) Navigator.pushNamed(context, '/booking');
          if (index == 2) Navigator.pushNamed(context, '/profile');
        },
      ),
    );
  }
}