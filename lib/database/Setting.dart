import 'package:floor/floor.dart';

@entity
class Setting {
  @primaryKey
  final int id;
  final bool isOnline;

  Setting(this.isOnline, this.id);
}
