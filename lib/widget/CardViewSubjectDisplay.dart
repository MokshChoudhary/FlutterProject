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
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Wrap(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Subject Name"),
            ),
          ),
          Stack(
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
                      minHeight: 18,
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
          )
        ],
      ),
    );
  }
}
