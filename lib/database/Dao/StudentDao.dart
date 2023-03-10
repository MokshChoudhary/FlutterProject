// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:studenthub/database/StudentData.dart';

@dao
abstract class StudentDao {
  @Query('Select * from Student')
  Future<List<StudentData>> findAllStudent();

  @Query("Select * from Student Where studentId = :id")
  Future<StudentData?> findStudentById(String id);

  @insert
  Future<void> insertStudent(StudentData student);
}
