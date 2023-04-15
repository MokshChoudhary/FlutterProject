// ignore_for_file: file_names
import 'package:floor/floor.dart';

@Entity(tableName: "Period")
class PeriodData {
  @primaryKey
  final String periodId;
  final String classId;
  final String timing;

  PeriodData(
      {required this.periodId, required this.classId, required this.timing});
}
