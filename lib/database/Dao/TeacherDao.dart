// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:studenthub/database/TeacherData.dart';

@dao
abstract class TeacherDao {
  @Query('Select * from Student')
  Future<List<TeacherData>> findAllTeacher();

  @Query("Select * from Student Where studentId = :id")
  Future<TeacherData?> findTeacherById(String id);

  @insert
  Future<int> insertTeacher(TeacherData teacher);
}
