import 'package:delivery_app/presentation/splash/splash_screen.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: SplashScreen()
    );
  }
}

