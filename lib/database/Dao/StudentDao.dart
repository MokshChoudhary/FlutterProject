// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:my_app/database/Student.dart';

@dao
abstract class StudentDao {
  @Query('Select * form Student')
  Future<List<Student>> findAllStudent();

  @Query("Select * form Student Where studentId = :id")
  Future<Student?> findStudentById(String id);

  @insert
  Future<void> insertStudent(Student student);
}
