import 'package:sqflite/sqflite.dart';
import '../migrations_config.dart';

class Migration01InitDB extends MigrationConfig {
  @override
  Future<void> up(Database db) async {
    const tableName = 'tableName';
    const columnName = 'columnName';
    List checkColumn = await db.rawQuery('PRAGMA table_info($tableName)');
    bool columnIsExist = false;

    for (var column in checkColumn) {
      if (column['name'] == columnName) {
        columnIsExist = true;
      }
    }

    if (!columnIsExist) {
      await db.execute(
          'ALTER TABLE $tableName ADD $columnName INTEGER DEFAULT 0 ;');
    }
  }
}
