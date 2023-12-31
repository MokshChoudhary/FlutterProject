// ignore: file_names
import 'package:flutter/material.dart';

class RegisterImpl {
  Column dropDown(String name, List<String>? listValues) {
    return Column(
      children: [
        DropdownButton<String>(
          value: name,
          icon: const Icon(Icons.arrow_drop_down),
          underline: Container(
            height: 2,
          ),
          onChanged: (String? value) {
            //genderDropdownValue = value!;
          },
          items: listValues!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }
}

//  ListView(
//               children: [
//                 Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         alignment: Alignment.centerLeft,
//                         child: GestureDetector(
//                           onTap: () {},
//                           child: const Icon(Icons.arrow_back),
//                         ),
//                       ),
//                     ),
//                     const Center(
//                       child: Text(
//                         "Registration Form",
//                         style: TextStyle(
//                             color: AppColor.primaryColor, fontSize: 28),
//                       ),
//                     )
//                   ],
//                 ),
//                 TextFormField(
//                   autocorrect: false,
//                   decoration: const InputDecoration(
//                     hintText: "e.g, Itachi",
//                     border: UnderlineInputBorder(),
//                     labelText: 'First Name',
//                   ),
//                   onFieldSubmitted: (value) => studentFnameValue = value,
//                 ),
//                 TextFormField(
//                   autocorrect: false,
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Last Name',
//                     hintText: "e.g, Uchiha",
//                   ),
//                   onFieldSubmitted: (value) => studentLnameValue = value,
//                 ),
//                 DropdownButton<String>(
//                   value: genderDropdownValue,
//                   icon: const Icon(Icons.arrow_drop_down),
//                   underline: Container(
//                     height: 2,
//                   ),
//                   onChanged: (String? value) {
//                     // This is called when the user selects an item.
//                     setState(() {
//                       genderDropdownValue = value!;
//                     });
//                   },
//                   items:
//                       genderList.map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//                 DropdownButton<String>(
//                   value: religionDropDownValue,
//                   icon: const Icon(Icons.arrow_drop_down),
//                   underline: Container(
//                     height: 2,
//                   ),
//                   onChanged: (String? value) {
//                     // This is called when the user selects an item.
//                     setState(() {
//                       religionDropDownValue = value!;
//                     });
//                   },
//                   items: religionList
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//                 DropdownButton(
//                     value: subCastDropDownValue,
//                     underline: Container(
//                       height: 2,
//                     ),
//                     items:
//                         subList.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (String? value) {
//                       // This is called when the user selects an item.
//                       setState(() {
//                         subCastDropDownValue = value!;
//                       });
//                     }),
//                 GestureDetector(
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
//                     child: Row(
//                       children: <Widget>[
//                         Text(
//                           "Select Date of Birth : ${dobValue.toString().split(" ")[0]}",
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Icon(Icons.date_range),
//                         ),
//                       ],
//                     ),
//                   ),
//                   onTap: () {
//                     showDatePicker(
//                       context: context,
//                       firstDate: DateTime.utc(DateTime.now().year - 60),
//                       lastDate: DateTime.now(),
//                       initialDate: dobValue,
//                     ).then((value) {
//                       try {
//                         setState(() {
//                           dobValue = value!;
//                         });
//                         dobValue = value!;
//                       } catch (e) {
//                         log(e.toString());
//                       }
//                       log("Value : $dobValue");
//                       log("Gender : $gender");
//                     });
//                   },
//                 ),
//                 TextFormField(
//                   autocorrect: false,
//                   onFieldSubmitted: (value) => aadharNumberValue = value,
//                   validator: (value) {
//                     if (value!.length < 12) {}
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Aadhar Card',
//                   ),
//                 ),
//                 TextFormField(
//                   autocorrect: false,
//                   onFieldSubmitted: (value) => addressValue = value,
//                   decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: 'Address Line 1',
//                       hintText:
//                           "House/Buldin, Street/Area, District, City/UT, Pin-Code"),
//                 ),
//                 TextFormField(
//                   autocorrect: false,
//                   onFieldSubmitted: (value) => motherNameValue = value,
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Mother Name',
//                   ),
//                 ),
//                 TextFormField(
//                   autocorrect: false,
//                   onFieldSubmitted: (value) => fatherNameValue = value,
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Father Name',
//                   ),
//                 ),
//                 TextFormField(
//                   autocorrect: false,
//                   onFieldSubmitted: (value) => gardiuanNumberValue = value,
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Gardiuan Name',
//                   ),
//                 ),
//                 TextFormField(
//                   autocorrect: false,
//                   onFieldSubmitted: (value) => passwordValue = value,
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Password',
//                   ),
//                 ),
//                 TextFormField(
//                   autocorrect: false,
//                   onFieldSubmitted: (value) => re_passwordValue = value,
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Re-Enter Password',
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: OutlinedButton(
//                           onPressed: () {
//                             if (passwordValue != re_passwordValue) {
//                               _showMyDialog("Password doesn't match!!");
//                             } else {
//                               var student = StudentData(
//                                   "${dobValue.toString()}_${DateTime.now().millisecondsSinceEpoch}_SchoolName",
//                                   studentFnameValue,
//                                   studentLnameValue,
//                                   genderDropdownValue,
//                                   0,
//                                   "",
//                                   dobValue.millisecondsSinceEpoch,
//                                   int.parse(aadharNumberValue.isNotEmpty
//                                       ? aadharNumberValue
//                                       : "0"),
//                                   addressValue,
//                                   subCastDropDownValue,
//                                   religionDropDownValue,
//                                   0,
//                                   0,
//                                   DateTime.now().millisecondsSinceEpoch,
//                                   fatherNameValue.split(" ")[0],
//                                   fatherNameValue.split(" ").length > 0
//                                       ? fatherNameValue.split(" ")[1]
//                                       : "",
//                                   motherNameValue.split(" ")[0],
//                                   motherNameValue.split(" ")[1].isNotEmpty
//                                       ? motherNameValue.split(" ")[1]
//                                       : "",
//                                   gardiuanNumberValue,
//                                   Security().encrypt(passwordValue).toString());
//                               var studentJson = jsonEncode(student);
//                               log(studentJson);
//                               var header = <String, String>{};
//                               header["Accept"] = "*/*";
//                               ServerAPI().POST_STRING(
//                                   AppServer.toUri(AppServer.student_register),
//                                   header: header,
//                                   body: studentJson);
//                             }
//                           },
//                           child: const Row(
//                             children: [Text("Submit"), Icon(Icons.check)],
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: OutlinedButton(
//                           onPressed: () => {},
//                           child: const Row(
//                             children: [
//                               Text("Submit & Next"),
//                               Icon(Icons.check)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),