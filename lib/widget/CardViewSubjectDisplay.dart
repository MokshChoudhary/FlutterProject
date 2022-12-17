// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:studenthub/constant/colors.dart';
import 'dart:math';

// ignore: must_be_immutable
class CardViewSubjectDisplay extends StatefulWidget {
  CardViewSubjectDisplay({super.key});

  int index = 0;

  @override
  _CardViewSubjectDisplay createState() => _CardViewSubjectDisplay();
}

class _CardViewSubjectDisplay extends State<CardViewSubjectDisplay> {
  Widget progressBar() {
    double value = Random().nextDouble();
    return Stack(
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: LinearProgressIndicator(
                semanticsLabel: "Marks",
                minHeight: 30,
                color: AppColor.primaryColor,
                value: value,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              (value * 100).toInt().toString(),
              style: const TextStyle(color: AppColor.secondaryTextColor),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "${(value * 100).toInt()}%",
              style: const TextStyle(color: AppColor.secondaryTextColor),
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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Subject Name"),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                const Center(
                  child: Text("Marks"),
                ),
                progressBar(),
              ],
            ),
            Column(
              children: <Widget>[
                const Center(
                  child: Text("Attendance"),
                ),
                progressBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
