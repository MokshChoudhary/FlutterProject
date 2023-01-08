// ignore_for_file: file_names

import 'package:floor/floor.dart';

@entity
class Login {
  final int loginBy;
  @primaryKey
  final String uniqueId;
  @primaryKey
  final String userId;
  final String password;

  Login(
      {required this.uniqueId,
      required this.loginBy,
      required this.userId,
      required this.password});
}
