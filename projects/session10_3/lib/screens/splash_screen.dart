// screens/splash_screen.dart
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Move navigation logic to initState to prevent multiple navigations
    Future.delayed(const Duration(seconds: 2), () {
      // Check if the widget is still mounted to prevent navigation errors
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 120,
              height: 120,
              // If the asset doesn't exist, show a text logo instead
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.flight_takeoff,
                  size: 80,
                  color: AppColors.white,
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Traveloka Clone',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}