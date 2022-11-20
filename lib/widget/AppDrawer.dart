// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:my_app/widget/Dilog.dart';
import '../constant/colors.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<StatefulWidget> createState() => MainAppDrawer();
}

class MainAppDrawer extends State<StatefulWidget> {
  void onTapNavMenu() {
    AppDialog().show(context);
  }

  Widget drawerList(String data) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () => onTapNavMenu(),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              data,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 2,
          color: Colors.black,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                          image:
                              AssetImage('images/user/icons8-contacts-512.png'),
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
                    drawerList("Home"),
                    drawerList("Profile"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
