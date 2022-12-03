// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:my_app/database/Login.dart';

@dao
abstract class LoginDao {
  @Query('Select * from Student;')
  Future<List<Login?>> findAllUser();

  @Query(
      'SELECT * FROM Student WHERE userId = :userId AND password = :password;')
  Future<List<Login?>> findUser(String userId, String password);
  @insert
  Future<int?> insertUser(Login user);
}
