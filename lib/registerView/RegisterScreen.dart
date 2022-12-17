// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../constant/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final studentFnameController = TextEditingController();
    final studentLnameController = TextEditingController();
    final dobController = TextEditingController();
    final aadharNumberController = TextEditingController();
    final addressController = TextEditingController();
    final joinDateController = TextEditingController();
    final fatherNameController = TextEditingController();
    final motherNameController = TextEditingController();
    final gardiuanNumberController = TextEditingController();

    String studentFnameValue = "";
    String studentLnameValue = "";
    String dobValue = "";
    String aadharNumberValue = "";
    String addressValue = "";
    String joinDateValue = "";
    String fatherNameValue = "";
    String motherNameValue = "";
    String gardiuanNumberValue = "";

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
                const Center(
                  child: Text(
                    "Registration Form",
                    style:
                        TextStyle(color: AppColor.primaryColor, fontSize: 28),
                  ),
                ),
                Center(
                  child: TextFormField(
                    autocorrect: false,
                    validator: (value) {
                      //do this later
                    },
                    controller: studentFnameController,
                    decoration: const InputDecoration(
                      hintText: "e.g, Itachi",
                      border: UnderlineInputBorder(),
                      labelText: 'First Name',
                    ),
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  controller: studentLnameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Last Name',
                    hintText: "Uchiha",
                  ),
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                    child: Row(
                      children: <Widget>[
                        const Text("Select Date of Birth : "),
                        Text(dobValue),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.date_range),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    final Future<DateTime?> picker = showDatePicker(
                      context: context,
                      firstDate: DateTime.utc(DateTime.now().year - 60),
                      lastDate: DateTime.now(),
                      initialDate: DateTime.now(),
                    );
                    setState(() {
                      picker.then((value) => {
                            dobValue = value.toString(),
                          });
                    });
                  },
                ),
                TextFormField(
                  autocorrect: false,
                  controller: aadharNumberController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Aadhar Cart',
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  controller: addressController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Address Line 1',
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  controller: joinDateController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Address Line 2',
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  controller: fatherNameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Address Line 3',
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  controller: motherNameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  controller: gardiuanNumberController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
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
