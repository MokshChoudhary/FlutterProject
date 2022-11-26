import 'package:flutter/material.dart';
import 'splashScreen.dart';

Future<void> main() async {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: SplashScreen(),
      ),
    ),
  );
}
