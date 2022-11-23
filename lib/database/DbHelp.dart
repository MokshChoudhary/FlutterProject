// ignore_for_file: file_names

import 'package:floor/floor.dart';
import 'package:my_app/View/SubjectView.dart';

@entity
class Student {
  @primaryKey
  final String studentId;
  final String studentFirstName;
  final String studentLastName;
  final int age;
  final List<String> teacherId;
  final List<SubjectInfo> subjects;

  Student(this.studentFirstName, this.subjects, this.studentLastName, this.age,
      this.teacherId,
      {required this.studentId});
}
