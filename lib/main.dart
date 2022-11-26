import 'package:flutter/material.dart';
import 'package:my_app/database/HubDatabase.dart';
import 'splashScreen.dart';

Future<void> main() async {
  final HubDatabase database =
      await $FloorHubDatabase.databaseBuilder('app_database.db').build();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: SplashScreen(
          database: database,
        ),
      ),
    ),
  );
}
