// screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/service_card.dart';
import 'transfer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Service> services = const [
    Service(Icons.send, 'Transfer'),
    Service(Icons.account_balance, 'Deposito'),
    Service(Icons.qr_code_scanner, 'QRIS'),
    Service(Icons.receipt, 'e-Statement'),
    Service(Icons.info, 'Info BCA'),
    Service(Icons.menu, 'Lainnya'),
  ];

  void _handleNavTap(int index) {
    setState(() => _currentIndex = index);
    
    // Handle navigation to different screens based on bottom nav index
    if (index == 1) { // QRIS
      // Navigate to QRIS screen
    } else if (index == 2) { // e-Statement
      // Navigate to e-Statement screen
    } else if (index == 3) { // Profile
      // Navigate to Profile screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png', 
          height: 32,
          errorBuilder: (context, error, stackTrace) {
            return const Text('myBCA', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person), 
            onPressed: () {
              setState(() => _currentIndex = 3); // Set to Profile tab
            },
          )
        ],
      ),
      drawer: AppDrawer(currentIndex: _currentIndex),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Balance Card
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Balance',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Rp 12,345,678',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text(
                          'Account: 1234567890',
                          style: TextStyle(fontSize: 12),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text('See Details'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            // Services Title
            const Text(
              'Services',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            // Services Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: services.map((service) {
                  return ServiceCard(
                    service: service,
                    onTap: () {
                      if (service.title == 'Transfer') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const TransferScreen(),
                          ),
                        );
                      } else if (service.title == 'QRIS') {
                        setState(() => _currentIndex = 1);
                      } else if (service.title == 'e-Statement') {
                        setState(() => _currentIndex = 2);
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: _handleNavTap,
      ),
    );
  }
}