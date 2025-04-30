// screens/booking_screen.dart
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(title: 'Your Bookings'),
      ),
      body: const Center(child: Text('Booking list will show here.')),
    );
  }
}