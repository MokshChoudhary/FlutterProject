// ignore_for_file: file_names

import 'dart:ffi';

import 'package:floor/floor.dart';
import 'package:my_app/View/SubjectView.dart';

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
  final DateTime dob;
  final int aadharNumber;
  final List<String> teacherId;
  final List<SubjectInfo> subjects;
  final String address;
  final Float marksObtain;
  final int attendsObtain;
  final DateTime joinIn;
  final String fatherFirstName;
  final String fatherLastName;
  final String motherFirstName;
  final String motherLastName;
  final int gardiuanNumber;

  Student(
      this.studentFirstName,
      this.subjects,
      this.studentLastName,
      this.dob,
      this.teacherId,
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
