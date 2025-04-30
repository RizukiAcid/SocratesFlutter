import 'package:flutter/material.dart';
import '../constants/colors.dart';

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const FeatureItem({required this.icon, required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.green.withOpacity(0.1),
          child: Icon(icon, color: AppColors.green, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: const [
        FeatureItem(icon: Icons.motorcycle, label: 'GoRide'),
        FeatureItem(icon: Icons.fastfood, label: 'GoFood'),
        FeatureItem(icon: Icons.local_shipping, label: 'GoSend'),
        FeatureItem(icon: Icons.shopping_bag, label: 'GoMart'),
        FeatureItem(icon: Icons.medical_services, label: 'GoMed'),
        FeatureItem(icon: Icons.movie, label: 'GoPlay'),
        FeatureItem(icon: Icons.more_horiz, label: 'More'),
        FeatureItem(icon: Icons.card_giftcard, label: 'Promo'),
      ],
    );
  }
}