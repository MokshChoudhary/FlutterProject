// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:studenthub/database/Login.dart';

@dao
abstract class LoginDao {
  @Query('Select * from Student;')
  Future<List<Login?>> findAllUser();

  @Query("Select * from Student;")
  Future<int?> getCount();

  @Query(
      'SELECT * FROM Student WHERE userId = :userId AND password = :password;')
  Future<List<Login?>> findUser(String userId, String password);

  @insert
  Future<int?> insertUser(Login user);
}
