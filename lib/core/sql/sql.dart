import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'sql_tables.dart';

class SQL {
  SQL._();

  static Future<Database> database() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), '${SQLTables.dbName}.db'),
      version: 1,
      onCreate: (db, version) => SQLTables(db).createTables(),
    );

    return db;
  }
}
