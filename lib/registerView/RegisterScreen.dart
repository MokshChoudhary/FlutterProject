import 'package:flutter/material.dart';
import 'package:my_app/constant/colors.dart';

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

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        home: Scaffold(
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autocorrect: false,
                        validator: (value) {
                          //do this later
                        },
                        controller: studentFnameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Abhinav',
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    autocorrect: false,
                    controller: studentLnameController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                    ),
                  ),
                  TextFormField(
                    autocorrect: false,
                    controller: dobController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                    ),
                  ),
                  TextFormField(
                    autocorrect: false,
                    controller: aadharNumberController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                    ),
                  ),
                  TextFormField(
                    autocorrect: false,
                    controller: addressController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                    ),
                  ),
                  TextFormField(
                    autocorrect: false,
                    controller: joinDateController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                    ),
                  ),
                  TextFormField(
                    autocorrect: false,
                    controller: fatherNameController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
