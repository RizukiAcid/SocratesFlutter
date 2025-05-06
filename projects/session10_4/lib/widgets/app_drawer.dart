import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/transfer_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF5AA5D2)),
            child: Text('Welcome, User', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen())),
          ),
          ListTile(
            leading: Icon(Icons.send),
            title: Text('Transfer'),
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => TransferScreen())),
          ),
          // Add more items as needed...
        ],
      ),
    );
  }
}