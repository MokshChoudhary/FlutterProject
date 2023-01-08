// ignore_for_file: file_names, library_private_types_in_public_api, non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';

import '../constant/colors.dart';

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
                  maxLength: 4,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: OutlinedButton(
                          onPressed: () => {},
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
