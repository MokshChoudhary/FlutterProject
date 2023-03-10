// ignore_for_file: file_names

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:studenthub/database/Dao/LoginDao.dart';
import 'package:studenthub/database/LoginData.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:studenthub/database/Dao/StudentDao.dart';
import 'package:studenthub/database/Dao/TeacherDao.dart';
import 'package:studenthub/database/Dao/SettingDao.dart';

import 'package:studenthub/database/StudentData.dart';
import 'package:studenthub/database/TeacherData.dart';
import 'package:studenthub/database/SettingData.dart';

part 'HubDatabase.g.dart';

@Database(
    version: 1, entities: [LoginData, TeacherData, StudentData, SettingData])
abstract class HubDatabase extends FloorDatabase {
  StudentDao get studentDao;
  TeacherDao get teacherDao;
  LoginDao get loginDao;
  SettingDao get settingDao;
}
