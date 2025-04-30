// widgets/service_grid.dart
import 'package:flutter/material.dart';

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {'icon': Icons.flight, 'label': 'Flights'},
      {'icon': Icons.hotel, 'label': 'Hotels'},
      {'icon': Icons.train, 'label': 'Trains'},
      {'icon': Icons.directions_car, 'label': 'Car Rental'},
      {'icon': Icons.local_activity, 'label': 'Attractions'},
      {'icon': Icons.medical_services, 'label': 'Insurance'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final service = services[index];
        return Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue.shade50,
              child: Icon(service['icon'], color: Colors.blue),
            ),
            const SizedBox(height: 8),
            Text(service['label'], textAlign: TextAlign.center),
          ],
        );
      },
    );
  }
}