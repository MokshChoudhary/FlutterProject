// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:my_app/database/Teacher.dart';

@dao
abstract class TeacherDao {
  @Query('Select * form Student')
  Future<List<Teacher>> findAllTeacher();

  @Query("Select * form Student Where studentId = :id")
  Future<Teacher?> findTeacherById(String id);

  @insert
  Future<int> insertTeacher(Teacher teacher);
}
