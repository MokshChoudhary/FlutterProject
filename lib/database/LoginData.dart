// ignore_for_file: file_names

import 'package:floor/floor.dart';

enum LoginType {
  student,
  teacher,
  admin,
  developer,
}

@Entity(tableName: "Login")
class LoginData {
  final int? loginBy;
  @primaryKey
  final String? uniqueId;
  @primaryKey
  final String? userId;
  final String? password;

  LoginData(
      {required this.uniqueId,
      required this.loginBy,
      required this.userId,
      required this.password});
}
