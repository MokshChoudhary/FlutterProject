// ignore_for_file: file_names
import 'dart:async';
import 'package:my_app/database/Dao/StudentDao.dart';
import 'package:my_app/database/Dao/TeacherDao.dart';
import 'package:my_app/database/HubDatabase.dart';

class HubDBHelper {
  late HubDatabase db;

  Future<void> initDb() async {
    db = await $FloorHubDatabase
        .databaseBuilder('StudentHubDatabase.db')
        .build();
  }

  StudentDao getUserDao() => db.studentDao;

  TeacherDao getTeacherDao() => db.teacherDao;
}
