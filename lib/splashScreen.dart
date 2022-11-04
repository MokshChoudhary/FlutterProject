// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  List<Widget> getCenterText() {
    return [
      Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            "Student",
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
            ),
          ),
        ),
      ),
      Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 211, 152, 2),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          child: const Text(
            "Hub",
            style: TextStyle(
              color: Colors.black,
              fontSize: 48,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: getCenterText()),
      ),
    );
  }
}
