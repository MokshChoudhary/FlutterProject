import 'package:flutter/material.dart';
// import 'package:studenthub/utils/Securty.dart';
import 'constant/config.dart';
import 'splashScreen.dart';

Future<void> main() async {
  if (!AppConfig.isDebug) {
    // print(Security().encrypt("System123#"));
    // print(Security().decrypt("P0CB5ykCqLT5GQ=="));
  } else {
    runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
