// main.dart
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const TravelokaCloneApp());
}

class TravelokaCloneApp extends StatelessWidget {
  const TravelokaCloneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traveloka Clone',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/booking': (context) => const BookingScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}