// ignore_for_file: file_names

import 'package:floor/floor.dart';

@Entity(tableName: "Class")
class Class {
  @primaryKey
  final String classId;
  final String className;

  Class(this.classId, this.className);
}
