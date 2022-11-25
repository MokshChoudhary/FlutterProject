// ignore_for_file: file_names
import 'package:floor/floor.dart';

import 'Class.dart';

@entity
class Student {
  @primaryKey
  final String studentId;
  final String studentFirstName;
  final String studentLastName;
  final String subjectId;
  final int cgpa;
  @ForeignKey(
      childColumns: ["classId"], parentColumns: ["classId"], entity: Class)
  final String classId;
  final int dob;
  final int aadharNumber;
  final String address;
  final double marksObtain;
  final int attendsObtain;
  final int joinIn;
  final String fatherFirstName;
  final String fatherLastName;
  final String motherFirstName;
  final String motherLastName;
  final int gardiuanNumber;

  Student(
      this.studentFirstName,
      this.studentLastName,
      this.dob,
      this.subjectId,
      this.cgpa,
      this.aadharNumber,
      this.address,
      this.marksObtain,
      this.attendsObtain,
      this.joinIn,
      this.fatherFirstName,
      this.fatherLastName,
      this.motherFirstName,
      this.motherLastName,
      this.gardiuanNumber,
      this.classId,
      {required this.studentId});
}
