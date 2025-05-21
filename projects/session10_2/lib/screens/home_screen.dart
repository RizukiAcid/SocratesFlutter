import 'package:flutter/material.dart';
import '../constants/colors.dart' as constants;
import '../widgets/feature_grid.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onNavTap(int index) {
    if (_selectedIndex == index) return; // Don't navigate if already on the page
    
    // Use named routes for navigation, for consistency with main.dart
    switch(index) {
      case 0:
        // Already on home, no navigation needed
        setState(() => _selectedIndex = 0);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/orders');
        break;
      case 2:
        // Chat functionality not yet implemented
        // Show a snackbar instead of changing to empty page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Chat feature coming soon!'))
        );
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(radius: 24),
                  Column(
                    children: const [
                      Text('Balance: Rp100.000', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('GoPay Coins: 120'),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.qr_code),
                    onPressed: () {},
                    color: constants.AppColors.green,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const FeatureGrid(),
              const SizedBox(height: 20),
              const BannerCarousel(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}