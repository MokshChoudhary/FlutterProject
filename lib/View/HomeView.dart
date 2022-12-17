// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:studenthub/View/SubjectView.dart';
import 'package:studenthub/widget/CardViewSubjectDisplay.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          "Home",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
        Flexible(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              for (int i = 0; i < 5; i++)
                GestureDetector(
                  onTap: () => {
                    debugPrint("OnTap subjectInfo"),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SubjectInfo()))
                  },
                  child: CardViewSubjectDisplay(),
                ),
            ],
          ),
        )
      ],
    );
  }
}
