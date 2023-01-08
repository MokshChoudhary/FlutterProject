// ignore_for_file: file_names
import 'package:floor/floor.dart';

@entity
class Period {
  @primaryKey
  final String periodId;
  final String classId;
  final String timing;

  Period({required this.periodId, required this.classId, required this.timing});
}
