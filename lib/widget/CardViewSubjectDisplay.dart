// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:my_app/constant/colors.dart';

// ignore: must_be_immutable
class CardViewSubjectDisplay extends StatefulWidget {
  CardViewSubjectDisplay({super.key});

  int index = 0;

  @override
  _CardViewSubjectDisplay createState() => _CardViewSubjectDisplay();
}

class _CardViewSubjectDisplay extends State<CardViewSubjectDisplay> {


  Widget progressBar() {
    return Stack(
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const LinearProgressIndicator(
                semanticsLabel: "Marks",
                minHeight: 30,
                color: AppColor.primaryColor,
                backgroundColor: AppColor.textColor,
                value: 0.75,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "75",
              style: TextStyle(color: AppColor.secondaryTextColor),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "75%",
              style: TextStyle(color: AppColor.secondaryTextColor),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "100",
              style: TextStyle(color: AppColor.secondaryTextColor),
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Subject Name"),
              ),
            ),
            Column( children : <Widget>[const Center(child: Text("Marks"),),progressBar(),],),
            Column( children : <Widget>[const Center(child: Text("Attendance"),),progressBar(),],),
          ],
        ),
      ),
    );
  }
}
