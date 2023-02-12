// ignore_for_file: file_names
import 'package:floor/floor.dart';

import 'Class.dart';

@entity
class Student {
  @primaryKey
  final String studentId;
  final String studentFirstName;
  final String studentLastName;
  //Gender are Male, Female and other (0,1,2)
  final String gender;
  final int cgpa;
  @ForeignKey(
      childColumns: ["classId"], parentColumns: ["classId"], entity: Class)
  final String classId;
  final int dob;
  final int aadharNumber;
  final String address;
  final String subCast;
  final String religion;
  final double marksObtain;
  final int attendsObtain;
  final int joinIn;
  final String fatherFirstName;
  final String fatherLastName;
  final String motherFirstName;
  final String motherLastName;
  final String gardiuanNumber;
  final String password;

  Student({
    required this.studentFirstName,
    required this.studentLastName,
    required this.dob,
    required this.cgpa,
    required this.aadharNumber,
    required this.address,
    required this.marksObtain,
    required this.attendsObtain,
    required this.joinIn,
    required this.fatherFirstName,
    required this.fatherLastName,
    required this.motherFirstName,
    required this.motherLastName,
    required this.gardiuanNumber,
    required this.classId,
    required this.gender,
    required this.subCast,
    required this.religion,
    required this.studentId,
    required this.password,
  });
}
