import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/service_card.dart';
import 'transfer_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Service> services = [
    Service(Icons.send, 'Transfer'),
    Service(Icons.account_balance, 'Deposito'),
    Service(Icons.qr_code_scanner, 'QRIS'),
    Service(Icons.receipt, 'e-Statement'),
    Service(Icons.info, 'Info BCA'),
    Service(Icons.menu, 'Lainnya'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 32),
        actions: [IconButton(icon: Icon(Icons.person), onPressed: () {})],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: services.map((service) {
            return ServiceCard(
              service: service,
              onTap: () {
                if (service.title == 'Transfer') {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => TransferScreen()));
                }
              },
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}