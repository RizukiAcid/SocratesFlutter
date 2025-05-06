import 'package:flutter/material.dart';

class Service {
  final IconData icon;
  final String title;
  const Service(this.icon, this.title);
}

class ServiceCard extends StatelessWidget {
  final Service service;
  final VoidCallback onTap;

  const ServiceCard({required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(service.icon, size: 32, color: Color(0xFF023989)),
            SizedBox(height: 8),
            Text(service.title, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}