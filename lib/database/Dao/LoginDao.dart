// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:studenthub/database/LoginData.dart';

@dao
abstract class LoginDao {
  @Query('Select * from Student;')
  Future<List<LoginData?>> findAllUser();

  @Query("Select COUNT(*) AS TOTAL from Student;")
  Future<int?> getCount();

  @Query(
      'SELECT * FROM Student WHERE studentId = :userId AND password = :password;')
  Future<List<LoginData?>> findUser(String userId, String password);

  @insert
  Future<int?> insertUser(LoginData user);
}
