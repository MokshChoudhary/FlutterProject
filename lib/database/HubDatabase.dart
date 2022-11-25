// ignore_for_file: file_names

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:my_app/database/Dao/StudentDao.dart';
import 'package:my_app/database/Dao/TeacherDao.dart';
import 'package:my_app/database/Student.dart';
import 'package:my_app/database/Teacher.dart';

part 'HubDatabase.g.dart';

@Database(version: 1, entities: [Teacher, Student])
abstract class HubDatabase extends FloorDatabase {
  StudentDao get studentDao;
  TeacherDao get teacherDao;
}
