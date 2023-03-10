import 'package:floor/floor.dart';

@entity
class SettingData {
  @primaryKey
  final int id;
  final bool isOnline;

  SettingData(this.isOnline, this.id);
}
