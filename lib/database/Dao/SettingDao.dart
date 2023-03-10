// ignore_for_file: file_names
import 'package:floor/floor.dart';
import 'package:studenthub/database/SettingData.dart';

@dao
abstract class SettingDao {
  @Query('Select * from Setting')
  Future<List<SettingData>> getAllSettings();

  @update
  Future<int> updateSetting(SettingData setting);

  @insert
  Future<void> insertSetting(SettingData setting);
}
