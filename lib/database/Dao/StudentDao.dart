// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:studenthub/database/Student.dart';

@dao
abstract class StudentDao {
  @Query('Select * from Student')
  Future<List<Student>> findAllStudent();

  @Query("Select * from Student Where studentId = :id")
  Future<Student?> findStudentById(String id);

  @insert
  Future<void> insertStudent(Student student);
}
