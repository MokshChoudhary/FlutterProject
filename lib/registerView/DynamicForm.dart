import 'package:flutter/material.dart';

import '../database/FormFieldModel.dart';

class DynamicForm extends StatefulWidget {
  @override
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  List<FormFieldModel> formFields = []; // List to hold form fields

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Form'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Display form fields dynamically
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
                    // Set initial value for each field
                    initialValue: formFields[index].value,
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            // Button to add more form fields
            ElevatedButton(
              onPressed: () {
                // Add a new field to the formFields list
                setState(() {
                  formFields.add(
                      FormFieldModel('Field ${formFields.length + 1}', ''));
                });
              },
              child: Text('Add Field'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DynamicForm(),
  ));
}
