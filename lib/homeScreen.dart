// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_app/View/HomeView.dart';
import 'package:my_app/constant/colors.dart';
import 'package:my_app/constant/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.primaryColor,
          icon: const Text(AppString.appName),
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onTapNavMenu() {
    //TODO close the Drawer after clicking the menu
    _showMyDialog();
  }

  Widget drawerList(String data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => onTapNavMenu(),
        child: Text(
          data,
          style: const TextStyle(
            fontSize: 18.0,
            color: AppColor.secondaryTextColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: const Text(
            AppString.appName,
            style: TextStyle(color: AppColor.textColor),
          ),
        ),
        drawer: Drawer(
          backgroundColor: AppColor.secondaryColor,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: AppColor.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(80),
                              color: AppColor.secondaryColor,
                            ),
                            width: 100,
                            height: 100,
                            child: const Image(
                              image: AssetImage(
                                  'images/user/icons8-contacts-512.png'),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        drawerList("saklndl"),
                        drawerList("ckajsnckja"),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: const Center(
              child: HomeView(),
            ),
          ),
        ),
      ),
    );
  }
}
