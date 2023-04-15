import 'package:floor/floor.dart';

@Entity(tableName: "Setting")
class SettingData {
  @primaryKey
  final int id;
  final bool isOnline;

  SettingData(this.isOnline, this.id);
}
