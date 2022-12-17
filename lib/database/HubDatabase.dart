// ignore_for_file: file_names

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:studenthub/database/Dao/LoginDao.dart';
import 'package:studenthub/database/Login.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:studenthub/database/Dao/StudentDao.dart';
import 'package:studenthub/database/Dao/TeacherDao.dart';
import 'package:studenthub/database/Student.dart';
import 'package:studenthub/database/Teacher.dart';

part 'HubDatabase.g.dart';

@Database(version: 1, entities: [Login, Teacher, Student])
abstract class HubDatabase extends FloorDatabase {
  StudentDao get studentDao;
  TeacherDao get teacherDao;
  LoginDao get loginDao;
}
