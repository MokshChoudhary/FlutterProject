// ignore_for_file: file_names
import 'package:floor/floor.dart';

import 'Class.dart';

@Entity(tableName: "Student")
class StudentData {
  @primaryKey
  final String studentId;
  final String studentFirstName;
  final String studentLastName;
  //Gender are Male, Female and other (0,1,2)
  final String gender;
  final int cgpa;
  @ForeignKey(
      childColumns: ["classId"], parentColumns: ["classId"], entity: Class)
  final String classId;
  final int dob;
  final int aadharNumber;
  final String address;
  final String subCast;
  final String religion;
  final int marksObtain;
  final int attendsObtain;
  final int joinIn;
  final String fatherFirstName;
  final String fatherLastName;
  final String motherFirstName;
  final String motherLastName;
  final String gardiuanNumber;
  final String password;

  static StudentData fromJSON(Map<String, dynamic> json) => StudentData(
      json["student_id"],
      json["student_first_name"],
      json["student_last_name"],
      json["gender"],
      json["cgpa"],
      json["class_id"],
      json["dob"],
      json["aadhar_number"],
      json["address"],
      json["sub_cast"],
      json["religion"],
      json["marks_obtain"],
      json["attends_obtain"],
      json["join_in"],
      json["father_first_name"],
      json["father_last_name"],
      json["mother_first_name"],
      json["mother_last_name"],
      json["gardiuan_number"],
      json["password"]);

  StudentData(
      this.studentId,
      this.studentFirstName,
      this.studentLastName,
      this.gender,
      this.cgpa,
      this.classId,
      this.dob,
      this.aadharNumber,
      this.address,
      this.subCast,
      this.religion,
      this.marksObtain,
      this.attendsObtain,
      this.joinIn,
      this.fatherFirstName,
      this.fatherLastName,
      this.motherFirstName,
      this.motherLastName,
      this.gardiuanNumber,
      this.password);

  // StudentData(
  //   this.studentFirstName,
  //   this.studentLastName,
  //   this.dob,
  //   this.cgpa,
  //   this.aadharNumber,
  //   this.address,
  //   this.marksObtain,
  //   this.attendsObtain,
  //   this.joinIn,
  //   this.fatherFirstName,
  //   this.fatherLastName,
  //   this.motherFirstName,
  //   this.motherLastName,
  //   this.gardiuanNumber,
  //   this.classId,
  //   this.gender,
  //   this.subCast,
  //   this.password,
  //   this.religion,
  //   this.studentId,
  // );
}
