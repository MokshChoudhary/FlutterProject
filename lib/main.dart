import 'package:flutter/material.dart';
import 'splashScreen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: SplashScreen(),
      ),
    ),
  );
}
