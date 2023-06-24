import 'package:sqflite/sqflite.dart';

class SQLTables {
  const SQLTables(this._db);

  static const dbName = 'main';
  static const todosTable = 'todos';

  final Database _db;

  Future<void> createTables() async {
    await _createTodosTable();
  }

  Future<void> _createTodosTable() async {
    await _db.execute(
      'CREATE TABLE IF NOT EXISTS $todosTable ('
      'id TEXT NOT NULL, '
      'text TEXT NOT NULL, '
      'priority TEXT NOT NULL, '
      'is_done INTEGER NOT NULL, '
      'deadline INTEGER,  '
      'PRIMARY KEY (id) '
      ')',
    );
  }
}
