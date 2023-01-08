// ignore_for_file: file_names
import 'dart:async';
import 'package:studenthub/database/Dao/LoginDao.dart';
import 'package:studenthub/database/Dao/StudentDao.dart';
import 'package:studenthub/database/Dao/TeacherDao.dart';
import 'package:studenthub/database/HubDatabase.dart';

class HubDBHelper {
  late HubDatabase db;

  Future<void> initDb() async {
    db = await $FloorHubDatabase
        .databaseBuilder('StudentHubDatabase.db')
        .build();
  }

  StudentDao getStudentDao() => db.studentDao;

  TeacherDao getTeacherDao() => db.teacherDao;

  LoginDao getUserDao() => db.loginDao;
}
