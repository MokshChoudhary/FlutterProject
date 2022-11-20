// ignore: file_names
import 'package:flutter/material.dart';
import 'package:my_app/widget/AppDrawer.dart';

import '../constant/colors.dart';

class SubjectInfo extends StatefulWidget {
  const SubjectInfo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SubjectInfoState createState() => _SubjectInfoState();
}

class _SubjectInfoState extends State<SubjectInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: AppColor.primaryColor,
          title: const Center(
            child: Text("Subject name"),
          ),
        ),
        body: const Text("test"),
      ),
    );
  }
}
