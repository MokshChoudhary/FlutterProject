// ignore_for_file: file_names

import 'package:floor/floor.dart';

@entity
class Teacher {
  @primaryKey
  final String teacherId;
  final String teacherName;
  final int dob;
  final String address;
  final String exprience;
  final String dateOfJoing;

  Teacher(this.teacherName, this.dob, this.address, this.exprience,
      this.dateOfJoing,
      {required this.teacherId});
}
