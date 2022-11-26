// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:my_app/database/Login.dart';

@dao
abstract class LoginDao {
  @Query('Select * from Student')
  Future<List<Login>> findAllUser();

  @insert
  Future<int> insertUser(Login user);
}
