// ignore_for_file: file_names, library_private_types_in_public_api, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:studenthub/constant/server.dart';

import '../constant/colors.dart';
import '../database/FormFieldModel.dart';
import '../database/StudentData.dart';
import '../service/ServersAPI.dart';
import '../utils/Securty.dart';

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
  late List<String> classId;
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

  void getMetaDataFromServer() async {
    var header = <String, String>{};
    header["Accept"] = "*/*";
    ServerAPI().POST_STRING(AppServer.toUri(AppServer.class_meta_data),
        header: header, body: "{'classId':''}");
  }

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

  List<FormFieldModel> formFields = [];
  void _submitForm() {
    // Implement your form submission logic here
    // For example, you can print the values to the console
    for (var field in formFields) {
      print('Field: ${field.label}, Value: ${field.value}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: formFields.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: TextFormField(
                        decoration:
                            InputDecoration(labelText: formFields[index].label),
                        onChanged: (value) {
                          setState(() {
                            formFields[index] =
                                FormFieldModel(formFields[index].label, value);
                          });
                        },
                        initialValue: formFields[index].value,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      formFields.add(
                          FormFieldModel('Field ${formFields.length + 1}', ''));
                    });
                  },
                  child: Text('Add Field'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Perform form submission here (e.g., validate fields, submit data)
                    _submitForm();
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
