import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/feature_grid.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/bottom_nav.dart';
import 'order_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    _HomeContent(),
    const OrderScreen(),
    const Center(child: Text('Chat Coming Soon')),  // placeholder
    const ProfileScreen(),
  ];

  void _onNavTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  color: AppColors.green,
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
    );
  }
}