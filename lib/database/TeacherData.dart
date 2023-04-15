// ignore_for_file: file_names

import 'package:floor/floor.dart';

@Entity(tableName: "Teacher")
class TeacherData {
  @primaryKey
  final String teacherId;
  final String teacherName;
  final int dob;
  final String address;
  final String exprience;
  final String dateOfJoing;
  final String periodId;

  TeacherData(this.teacherName, this.dob, this.address, this.exprience,
      this.dateOfJoing, this.periodId, this.teacherId);
}
