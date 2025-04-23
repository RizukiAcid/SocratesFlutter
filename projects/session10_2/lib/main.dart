import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gojek_clone/providers/ride_provider.dart';
import 'package:gojek_clone/screens/splash/splash_screen.dart';
import 'package:gojek_clone/utils/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RideProvider()),
      ],
      child: MaterialApp(
        title: 'Gojek Clone',
        theme: appTheme,
        home: SplashScreen(),
      ),
    );
  }
}
