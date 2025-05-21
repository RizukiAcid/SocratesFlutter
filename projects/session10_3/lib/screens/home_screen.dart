// screens/home_screen.dart
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/service_grid.dart';
import '../widgets/custom_appbar.dart';
import 'booking_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  
  // List of pages to display in the bottom navigation
  final List<Widget> _pages = [
    const _HomeContent(),
    const BookingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show the appropriate app bar for each tab
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: _currentIndex == 0
            ? const CustomAppBar(title: 'Traveloka')
            : _currentIndex == 1
                ? const CustomAppBar(title: 'Your Bookings')
                : const CustomAppBar(title: 'My Profile'),
      ),
      // Show the appropriate page for the current tab
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          // Use setState to update the current tab
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// Extracted home content into a separate widget
class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        BannerCarousel(),
        SizedBox(height: 16),
        ServiceGrid(),
      ],
    );
  }
}