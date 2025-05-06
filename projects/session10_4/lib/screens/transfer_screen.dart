import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bottom_nav.dart';

class TransferScreen extends StatefulWidget {
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transfer')),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          ListTile(leading: Icon(Icons.account_balance), title: Text('Ke Rekening BCA')),
          ListTile(leading: Icon(Icons.send), title: Text('Antar Bank')),
          // Add more transfer options...
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: (idx) {
          // Handle nav tap if needed
        },
      ),
    );
  }
}