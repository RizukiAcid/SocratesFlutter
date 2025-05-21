// widgets/app_drawer.dart
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/transfer_screen.dart';

class AppDrawer extends StatelessWidget {
  final int currentIndex;
  
  const AppDrawer({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF5AA5D2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Color(0xFF5AA5D2)),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Welcome,',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: currentIndex == 0,
            selectedTileColor: const Color(0xFFE3F2FD),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              if (!(context.findAncestorWidgetOfExactType<HomeScreen>() != null)) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.send),
            title: const Text('Transfer'),
            selected: context.findAncestorWidgetOfExactType<TransferScreen>() != null,
            selectedTileColor: const Color(0xFFE3F2FD),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              if (!(context.findAncestorWidgetOfExactType<TransferScreen>() != null)) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const TransferScreen()),
                );
              }
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.qr_code_scanner),
            title: const Text('QRIS'),
            selected: currentIndex == 1,
            selectedTileColor: const Color(0xFFE3F2FD),
            onTap: () {
              Navigator.pop(context);
              // Handle QRIS navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt),
            title: const Text('e-Statement'),
            selected: currentIndex == 2,
            selectedTileColor: const Color(0xFFE3F2FD),
            onTap: () {
              Navigator.pop(context);
              // Handle e-Statement navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Info BCA'),
            onTap: () {
              Navigator.pop(context);
              // Handle Info BCA navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Show logout confirmation dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                        // Handle logout logic
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}