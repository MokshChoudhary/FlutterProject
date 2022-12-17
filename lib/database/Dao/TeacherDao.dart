// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:studenthub/database/Teacher.dart';

@dao
abstract class TeacherDao {
  @Query('Select * from Student')
  Future<List<Teacher>> findAllTeacher();

  @Query("Select * from Student Where studentId = :id")
  Future<Teacher?> findTeacherById(String id);

  @insert
  Future<int> insertTeacher(Teacher teacher);
}
