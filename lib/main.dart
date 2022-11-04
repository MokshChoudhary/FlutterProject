import 'package:flutter/material.dart';
import 'splashScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First Application"),
        ),
        body: SplashScreen(),
      ),
    ),
  );
}
