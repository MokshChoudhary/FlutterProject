// ignore_for_file: file_names

import 'package:floor/floor.dart';

@entity
class Login {
  @primaryKey
  final int loginBy;
  @primaryKey
  final String userId;
  final String password;

  Login({required this.loginBy, required this.userId, required this.password});
}
