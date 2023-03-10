// ignore_for_file: file_names, library_private_types_in_public_api, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:studenthub/constant/server.dart';

import '../constant/colors.dart';
import '../database/StudentData.dart';
import '../service/ServersAPI.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<StatefulWidget> {
  DateTime dobValue = DateTime.now();
  String studentFnameValue = "";
  String studentLnameValue = "";
  String gender = "";
  String sub_cast = "";
  String relegin = "";
  String aadharNumberValue = "";
  String addressValue = "";
  String joinDateValue = "";
  String fatherNameValue = "";
  String motherNameValue = "";
  String gardiuanNumberValue = "";
  String re_passwordValue = "";
  String passwordValue = "";
  List<String> genderList = ["Gender", "Male", "Female", "Other"];
  String genderDropdownValue = "Gender";
  List<String> religionList = [
    "Religion",
    "Hindi",
    "Sikh",
    "Jain",
    "Buddisam",
    "Krishan",
    "Muslim"
  ];
  String religionDropDownValue = "Religion";

  List<String> subList = ["SubCast", "Genral", "OBC", "SC", "ST"];
  String subCastDropDownValue = "SubCast";

  Future<void> _showMyDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Connection Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Registration Form",
                        style: TextStyle(
                            color: AppColor.primaryColor, fontSize: 28),
                      ),
                    )
                  ],
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: "e.g, Itachi",
                    border: UnderlineInputBorder(),
                    labelText: 'First Name',
                  ),
                  onFieldSubmitted: (value) => studentFnameValue = value,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Last Name',
                    hintText: "e.g, Uchiha",
                  ),
                  onFieldSubmitted: (value) => studentLnameValue = value,
                ),
                DropdownButton<String>(
                  value: genderDropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      genderDropdownValue = value!;
                    });
                  },
                  items:
                      genderList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: religionDropDownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      religionDropDownValue = value!;
                    });
                  },
                  items: religionList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton(
                    value: subCastDropDownValue,
                    underline: Container(
                      height: 2,
                    ),
                    items:
                        subList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        subCastDropDownValue = value!;
                      });
                    }),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Select Date of Birth : ${dobValue.toString().split(" ")[0]}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.date_range),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.utc(DateTime.now().year - 60),
                      lastDate: DateTime.now(),
                      initialDate: dobValue,
                    ).then((value) {
                      try {
                        setState(() {
                          dobValue = value!;
                        });
                        dobValue = value!;
                      } catch (e) {
                        log(e.toString());
                      }
                      log("Value : $dobValue");
                      log("Gender : $gender");
                    });
                  },
                ),
                TextFormField(
                  autocorrect: false,
                  onFieldSubmitted: (value) => aadharNumberValue = value,
                  validator: (value) {
                    if (value!.length < 12) {}
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Aadhar Card',
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  onFieldSubmitted: (value) => addressValue = value,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Address Line 1',
                      hintText:
                          "House/Buldin, Street/Area, District, City/UT, Pin-Code"),
                ),
                TextFormField(
                  autocorrect: false,
                  onFieldSubmitted: (value) => motherNameValue = value,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Mother Name',
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  onFieldSubmitted: (value) => fatherNameValue = value,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Father Name',
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  onFieldSubmitted: (value) => gardiuanNumberValue = value,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Gardiuan Name',
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  onFieldSubmitted: (value) => passwordValue = value,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  onFieldSubmitted: (value) => re_passwordValue = value,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Re-Enter Password',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: OutlinedButton(
                          onPressed: () {
                            if (passwordValue != re_passwordValue) {
                              _showMyDialog("Password doesn't match!!");
                            } else {
                              var student = StudentData(
                                  studentFirstName: studentFnameValue,
                                  studentLastName: studentLnameValue,
                                  dob: dobValue.millisecondsSinceEpoch,
                                  cgpa: 0,
                                  aadharNumber: int.parse(aadharNumberValue),
                                  address: addressValue,
                                  marksObtain: 0,
                                  attendsObtain: 0,
                                  joinIn: DateTime.now().millisecondsSinceEpoch,
                                  fatherFirstName:
                                      fatherNameValue.split(" ")[0],
                                  fatherLastName: fatherNameValue.split(" ")[1],
                                  motherFirstName:
                                      motherNameValue.split(" ")[0],
                                  motherLastName: motherNameValue.split(" ")[1],
                                  gardiuanNumber: gardiuanNumberValue,
                                  classId: "",
                                  gender: genderDropdownValue,
                                  subCast: subCastDropDownValue,
                                  religion: religionDropDownValue,
                                  studentId: "studentId",
                                  password: passwordValue);

                              var studentJson = jsonEncode(student);
                              log(studentJson);
                              var header = <String, String>{};
                              header["Accept"] = "*/*";
                              ServerAPI.POST_STRING(
                                  AppServer.toUri(AppServer.student_register),
                                  header: header,
                                  body: studentJson);
                            }
                          },
                          child: Row(
                            children: const [Text("Submit"), Icon(Icons.check)],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton(
                          onPressed: () => {},
                          child: Row(
                            children: const [
                              Text("Submit & Next"),
                              Icon(Icons.check)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
