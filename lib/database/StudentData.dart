// ignore_for_file: file_names
import 'package:floor/floor.dart';

import 'Class.dart';

@entity
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
  final double marksObtain;
  final int attendsObtain;
  final int joinIn;
  final String fatherFirstName;
  final String fatherLastName;
  final String motherFirstName;
  final String motherLastName;
  final String gardiuanNumber;
  final String password;

  factory StudentData.fromJSON(Map<String, dynamic> json) => StudentData(
      studentId: json["student_id"],
      studentFirstName: json["student_first_name"],
      studentLastName: json["student_last_name"],
      gender: json["gender"],
      cgpa: json["cgpa"],
      classId: json["class_id"],
      dob: json["dob"],
      aadharNumber: json["aadhar_number"],
      address: json["address"],
      subCast: json["sub_cast"],
      religion: json["religion"],
      marksObtain: json["marks_obtain"],
      attendsObtain: json["attends_obtain"],
      joinIn: json["join_in"],
      fatherFirstName: json["father_first_name"],
      fatherLastName: json["father_last_name"],
      motherFirstName: json["mother_first_name"],
      motherLastName: json["mother_last_name"],
      gardiuanNumber: json["gardiuan_number"],
      password: json["password"]);

  StudentData({
    required this.studentFirstName,
    required this.studentLastName,
    required this.dob,
    required this.cgpa,
    required this.aadharNumber,
    required this.address,
    required this.marksObtain,
    required this.attendsObtain,
    required this.joinIn,
    required this.fatherFirstName,
    required this.fatherLastName,
    required this.motherFirstName,
    required this.motherLastName,
    required this.gardiuanNumber,
    required this.classId,
    required this.gender,
    required this.subCast,
    required this.religion,
    required this.studentId,
    required this.password,
  });

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
