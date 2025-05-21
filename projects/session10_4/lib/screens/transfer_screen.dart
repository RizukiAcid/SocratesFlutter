// screens/transfer_screen.dart
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bottom_nav.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  int _currentIndex = 0; // Start with Home tab selected

  void _handleNavTap(int index) {
    if (index == 0) {
      // Go back to home screen
      Navigator.pop(context);
    } else {
      setState(() => _currentIndex = index);
      // Handle other navigation if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transfer')),
      drawer: AppDrawer(currentIndex: _currentIndex),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Transfer To',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFF5AA5D2),
                child: Icon(Icons.account_balance, color: Colors.white),
              ),
              title: const Text('BCA Account'),
              subtitle: const Text('Transfer to any BCA account'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to BCA transfer form
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFF5AA5D2),
                child: Icon(Icons.send, color: Colors.white),
              ),
              title: const Text('Other Bank'),
              subtitle: const Text('Transfer to other bank accounts'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to other bank transfer form
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFF5AA5D2),
                child: Icon(Icons.group, color: Colors.white),
              ),
              title: const Text('To My Contacts'),
              subtitle: const Text('Transfer to saved contacts'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to contacts list
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: _handleNavTap,
      ),
    );
  }
}