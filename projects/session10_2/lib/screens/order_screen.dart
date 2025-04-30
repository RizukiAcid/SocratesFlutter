import 'package:flutter/material.dart';
import '../constants/colors.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, i) => Card(
          child: ListTile(
            leading: const Icon(Icons.receipt),
            title: Text('Order #${i + 1}'),
            subtitle: const Text('Status: Delivered'),
          ),
        ),
      ),
    );
  }
}