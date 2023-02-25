// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:studenthub/database/Setting.dart';

@dao
abstract class SettingDao {
  @Query('Select * from Setting')
  Future<List<Setting>> getAllSettings();

  @update
  Future<int> updateSetting(Setting setting);

  @insert
  Future<void> insertSetting(Setting setting);
}
